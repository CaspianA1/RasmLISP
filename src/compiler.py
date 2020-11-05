import parser
from procedures import *
from re import compile as regex
from copy import copy
from sys import argv

special_forms = "define", "define_macro", "lambda", "if", "include", "begin", "quote"
branch_id, lambda_id = 0, 0
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

def check_for_unbound_vars(ast: list):
	for node in ast[1:]:
		if isinstance(node, list):
			check_for_unbound_vars(node)
		elif not number_pattern.match(node) and node[0] not in ("[", "'"):
			if node not in global_vars and node not in procedures:
				raise NameError(f"Unbound symbol {node}")

def push_atomic_result(atom: str, program: Program, has_caller: bool):
	if atom in global_vars:
		program.emit(f"mov rax, [{atom} + rip]")
		if has_caller: program.emit("push rax")
	else:
		if has_caller: program.emit(f"push {atom}")
		else: program.emit(f"mov rax, {atom}")

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
				push_atomic_result(sexpr, program, has_caller)	
			else:
				eval_lisp(sexpr, program, has_caller, compiling_if = True)
			program.emit(f"jmp end_{end_if}")

		make_branch(sexpr[2], "true", is_true)
		make_branch(sexpr[3], "false", is_false)
		program.emit(f"end_{end_if}:")

	elif form == "include":
		# why is infile accessible from here?
		to_include = sexpr[1].replace("\"", "").replace("'", "")
		tokens = parser.tokenize(to_include)
		while (tree := parser.parse(tokens)) is not None:
			eval_lisp(tree, program, eval_proc = True)

	elif form == "define_macro":
		name, args, body = sexpr[1][0], sexpr[1][1:], sexpr[2]
		macros[name] = args, body

	elif form == "lambda":  # not complete
		global lambda_id
		lambda_id += 1
		its_id = lambda_id

		program.emit(f"jmp after_lambda_{its_id}")
		program.emit(f"lambda_{its_id}:")
		program.emit("push rbp", "mov rbp, rsp")
		w_offsets = params_as_offsets(sexpr[2], sexpr[1])
		eval_lisp(w_offsets, program, has_caller)
		program.emit("mov rbp, rsp", "pop rbp", "ret")
		program.emit(f"after_lambda_{its_id}:", f"lea rax, [lambda_{its_id} + rip]")

	elif form == "begin":
		to_return = sexpr.pop()

		for expr in sexpr[1:]:
			eval_lisp(expr, program)

		if not isinstance(to_return, list):
			push_atomic_result(to_return, program, has_caller)
		else:
			eval_lisp(to_return, program, has_caller = True)

def params_as_offsets(sexpr, params):
	for index, arg in enumerate(sexpr):
		if isinstance(arg, list):
			sexpr[index] = params_as_offsets(arg, params)
		elif arg in params:
			sexpr[index] = f"[rbp + {8 * (params.index(arg) + 1) + 8}]"
	return sexpr

def define_proc(sexpr, program, has_caller = False):
	name, params, body = sexpr
	make_procedure(name, params)

	program.defining_proc = True
	program.emit(f"{name}:", tab = False)
	program.emit("push rbp", "mov rbp, rsp")

	param_offsets = params_as_offsets(body, params)
	eval_lisp(param_offsets, program, eval_proc = True)
	program.emit("mov rsp, rbp", "pop rbp", "ret")
	program.defining_proc = False

def eval_lisp(sexpr, program, has_caller = False, eval_proc = False, compiling_if = False):
	procedure, args = sexpr[0], sexpr[1:]  # eval proc if is a list

	if procedure in special_forms:
		eval_special_form(sexpr, program, has_caller)
		return

	elif procedure in macros:
		macro = macros[procedure]
		eval_lisp(expand_macro(macro[1], dict(zip(macro[0], sexpr[1:]))), program, has_caller)
		return

	check_for_unbound_vars(sexpr)

	anonymous_f = False

	try:
		proc_obj = procedures[procedure]
		if len(args) != len(proc_obj.arguments) and proc_obj.name != "list_of":
			raise TypeError(f"Wrong argument count to procedure <{procedure}>")
	except KeyError:
		anonymous_f = True
	
	for arg in args[::-1]:
		if isinstance(arg, list):
			eval_lisp(arg, program, True)
		else:
			if arg in global_vars:
				# program.emit(f"mov rsi, [{arg} + rip]", "push rsi  # push variable")
				program.emit(f"push [{arg} + rip]")
			elif arg in procedures:
				program.emit(f"lea rsi, [{arg} + rip]  # address of procedure {arg}", "push rsi")
			else:
				program.emit(f"push {arg}  # push argument to {procedure}")

		if procedure == "list_of":
			type_tag = 2 if isinstance(arg, list) else 1
			program.emit(f"push {type_tag}  # type tag for list_of")

	if procedure == "list_of":
		program.emit(f"mov r13, {(l := len(args))}  # list of length {l}")

	if anonymous_f:
		to_call = procedure
	else:
		to_call = proc_obj.name

	program.emit(f"call {to_call}")

	if not eval_proc:
		plural = "" if (l := len(args)) == 1 else "s"
		discard_offset = l * 8
		if procedure == "list_of":
			discard_offset *= 2
		program.emit(f"add rsp, {discard_offset}  # discard {l} local argument{plural}")

	if has_caller and not compiling_if:
		program.emit(f"push rax  # result of {procedure}")

def main(infile, outfile):
	program = Program()

	program.emit("call _begin_gc", "and rsp, -16")

	tokens = parser.tokenize(infile)
	while (tree := parser.parse(tokens)) is not None:
		eval_lisp(tree, program)

	program.emit("and rsp, -16", "call _end_gc")
	program.emit("xor rdi, rdi", "mov rax, 0x2000001", "syscall")
	program.export(outfile)

if __name__ == "__main__":
	infile, outfile = "", ""
	try:
		infile = argv[1]
		outfile = infile.rstrip("lisp") + "asm"
		if len(argv) >= 3:
			if argv[2] == "debug":
				infile = "tests/" + infile; outfile = "tests/" + outfile
	except IndexError:
		print("Please provide a filename.")  # may be thrown by other cases as well
	main(infile, outfile)

"""
Working on right now:
Find a good garbage collector
Printing lists via a scheme function

Feasible features:
Division
Floating-point math
Lambda
A variadic `display`
Quote
Comparing lists via equal?

Linking plan:
Make all symbols visible from helper_functions.asm

One-day features:
pmatch
cond
case
curses bindings
symbols
error reporting procedure

Limitations:
- Variables cannot be redefined, so their types are static and treated as inferred
- Only `list_of` makes lists, and it is the only variadic function
- No anonymous functions
- `display` is non-polymorphic between lists and atoms
"""