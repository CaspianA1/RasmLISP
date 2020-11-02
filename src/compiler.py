import parser
from procedures import *
from re import compile as regex
from copy import copy
from sys import argv

special_forms = "define", "define-macro", "lambda", "if", "include"
builtin_procs = "display", "newline"
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

	elif form == "define-macro":
		name, args, body = sexpr[1][0], sexpr[1][1:], sexpr[2]
		macros[name] = args, body

	elif form == "lambda":
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
				program.emit(f"mov rsi, [{arg} + rip]", "push rsi  # push variable")
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
	eval_lisp(["include", "../lib/lib.lisp"], program)
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
Working on right now:
Lists and lambda

Bugs:

Stops at the first list:
(define test_list (list_of 7 (list_of 8 9) 10 11 12))
(display_a_list test_list)

Solution:
Make a ending counter which starts at one.
For each nested list, add one to this
If its ending is null, subtract 1
If the counter is zero, exit

Segfault:
(define test_list (list_of (list_of 1 2) 3))
(display_a_list test_list)

Solution:
Figure out how to align the stack correctly (by using `and rsp, -16` in the right spot),
So that this example doesn't crash, and the previous one doesn't crash as well

(define x (list_of 1))
(display_list x)

(display_a_list (list_of 1 2 (list_of 3 4) 5 6))

(define (x) (lambda (a b) (+ a b)))
(define y (x))
(display_num (y 2 3))

Can't get car of a nested list:
(define test_list (list_of (list_of 1 2) (list_of 2 3) 4))
(display_a_list (car (car test_list)))

Feasible features:
division
floating-point math
list_of, car, cdr, lists in lists
A garbage collector (use a collecting _malloc)
The function null?
lambda

One-day features:
lists
pmatch
cond
case
curses bindings
symbols
error reporting procedure

Limitations:
- Variables cannot be redefined, so their types are static and inferred
- Only `list_of` makes lists, and it is the only variadic function
- No anonymous functions
- `display` is non-polymorphic between lists and atoms
- (Note: if `atom?` can be made, then polymorphic behavior is possible)
"""