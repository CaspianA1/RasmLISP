import parser
from procedures import *
from re import compile as regex
from copy import copy
from sys import argv

special_forms = "define", "macro", "lambda", "if", "include"
builtin_procs = "display", "newline"
branch_id = 0
number_pattern = regex("^-?\d*(\.\d+)?$")
global_vars = []
macros = {}

def expand_macro(macro, param_arg_map):
	for index, item in enumerate(macro):
		if isinstance(item, list):
			macro[index] = expand_macro(item, param_arg_map)
		elif item in param_arg_map:
			macro[index] = param_arg_map[item]
	return macro

def check_for_unbound_vars(ast):
	for node in ast[1:]:
		if isinstance(node, list):
			check_for_unbound_vars(node)
		elif not number_pattern.match(node) and node not in global_vars and node[0] != "[":
			raise NameError(f"Unbound symbol {node}")

def eval_special_form(sexpr, program, has_caller = False):
	form, args = sexpr[0], sexpr[1:]

	if form == "define":
		name, value = sexpr[1:]
		if isinstance(name, list):  # is a procedure
			define_proc([sexpr[1][0], sexpr[1][1:], sexpr[2]], program, has_caller)
		else:
			global_vars.append(name)
			if isinstance(value, list):  # sexpr-defined value
				program.declare_var(name, 0)
				eval_lisp(value, program, has_caller)
				program.emit(f"mov [{name} + rip], rax")
			else:
				program.declare_var(name, value)  # constant value
			
	elif form == "if":
		# mutable state!
		def make_branch_id():
			global branch_id
			branch_id += 1
			return branch_id

		eval_lisp(sexpr[1], program, has_caller, compiling_if = True)
		program.emit("cmp rax, 1  # is true?")
		is_true, is_false, end_if = make_branch_id(), make_branch_id(), make_branch_id()
		program.emit(f"je true_{is_true}  # true branch", f"jmp false_{is_false}  # false branch")

		def make_branch(sexpr, b_type, b_id):
			program.emit(f"{b_type}_{b_id}:")
			if isinstance(sexpr, str):  # atom
				if sexpr in global_vars:
					program.emit(f"mov rax, [{sexpr} + rip]")
					if has_caller: program.emit("push rax")
				else:
					if has_caller: program.emit(f"push {sexpr}")
					else: program.emit(f"mov rax, {sexpr}")
			else:
				eval_lisp(sexpr, program, has_caller, compiling_if = True)
			program.emit(f"jmp end_{end_if}")

		make_branch(sexpr[2], "true", is_true)
		make_branch(sexpr[3], "false", is_false)
		program.emit(f"end_{end_if}:")

	elif form == "include":
		for sexpr in parser.tokenize_file("tests/" + sexpr[1]):
			eval_lisp(parser.parse(sexpr), program, eval_proc = True)

	elif form == "macro":
		name, args, body = sexpr[1][0], sexpr[1][1:], sexpr[2]
		macros[name] = args, body

def define_proc(sexpr, program, has_caller = False):
	name, params, body = sexpr
	make_procedure(name, params)

	program.defining_proc = True
	program.emit(f"{name}:", tab = False)
	program.emit("push rbp", "mov rbp, rsp")

	def params_as_offsets(sexpr):
		for index, arg in enumerate(sexpr):
			if isinstance(arg, list):
				sexpr[index] = params_as_offsets(arg)
			elif arg in params:
				sexpr[index] = f"[rbp + {8 * (params.index(arg) + 1) + 8}]"
		return sexpr

	param_offsets = params_as_offsets(body)
	eval_lisp(param_offsets, program, eval_proc = True)
	program.emit("mov rsp, rbp", "pop rbp", "ret")
	program.defining_proc = False

def eval_lisp(sexpr, program, has_caller = False, eval_proc = False, compiling_if = False):
	procedure, args = sexpr[0], sexpr[1:]

	if procedure in special_forms:
		eval_special_form(sexpr, program, has_caller)
		return

	elif procedure in macros:
		macro = macros[procedure]
		eval_lisp(expand_macro(macro[1], dict(zip(macro[0], sexpr[1:]))), program, has_caller)
		return

	check_for_unbound_vars(sexpr)

	proc_obj = procedures[procedure]
	if len(args) != len(proc_obj.arguments):
		raise TypeError(f"Wrong argument count to procedure <{procedure}>")
	for arg in args[::-1]:
		if isinstance(arg, list):
			eval_lisp(arg, program, True)
		else:
			if arg in global_vars:
				program.emit(f"mov rsi, [{arg} + rip]", "push rsi  # push variable")
			else:
				program.emit(f"push {arg}  # push argument to {procedure}")

	program.emit(f"call {proc_obj.name}")

	if not eval_proc:
		plural = "" if (l := len(args)) == 1 else "s"
		program.emit(f"add rsp, {l * 8}  # discard {l} local argument{plural}")

	if has_caller and not compiling_if:
		program.emit(f"push rax  # result of {procedure}")

def main(infile, outfile):
	program = Program()
	for index, sexpr in enumerate(parser.tokenize_file(infile)):
		eval_lisp(parser.parse(sexpr), program)

	program.emit("mov rdi, 0", "mov rax, 0x2000001", "syscall")
	program.export(outfile)

if __name__ == "__main__":
	try:
		infile = argv[1]
		outfile = infile.rstrip("lisp") + "asm"
		if len(argv) >= 3 and argv[2] == "debug":
			infile = "tests/" + infile; outfile = "tests/" + outfile
		main(infile, outfile)
	except IndexError:
		print("Please provide a filename.")

"""
Bugs:

Features:
Next up: division
Comparison operators: <, >, <=, >=

One-day features:
pmatch
cond
case
curses bindings
I just added macros!
"""