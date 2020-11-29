import parser
from procedures import *
from re import compile as regex
from sys import argv

special_forms = ("define", "set!", "let", "define_macro",
				"quote", "include", "if", "cond", "lambda", "begin", "asm")
branch_id, lambda_id = 0, 0
number_pattern = regex("^-?\d*(\.\d+)?$")
global_vars = ["nil", "MAX_NUM", "KEY_UP", "KEY_DOWN", "KEY_LEFT", "KEY_RIGHT", "KEY_ENTER"]
macros, symbols = {}, []

def expand_macro(macro, param_arg_map):
	if isinstance(macro, str):
		return macro
	else:
		for index, item in enumerate(macro):
			if isinstance(item, list):
				macro[index] = expand_macro(item, param_arg_map)
			elif item in param_arg_map:
				macro[index] = param_arg_map[item]
		return macro

def check_for_unbound_vars(ast: list):
	return
	if ast[0] not in special_forms:
		for node in ast[1:]:
			if isinstance(node, list):
				check_for_unbound_vars(node)
			elif not number_pattern.match(node) and node[0] not in ("[", "'"):
				if node not in global_vars and node not in procedures:
					raise NameError(f"Unbound symbol {node}: {ast}")

def push_atomic_result(atom: str, program: Program, has_caller: bool):
	if atom in global_vars:
		program.emit(f"mov rax, [{atom} + rip]")
		if has_caller: program.emit("push rax")
	else:
		if has_caller: program.emit(f"push {atom}")
		else: program.emit(f"mov rax, {atom}")

def eval_special_form(sexpr, program, has_caller = False):
	# mutable state!
	def make_branch_id():
		global branch_id
		branch_id += 1
		return branch_id

	form, args = sexpr[0], sexpr[1:]

	def extern_sym(name):
		if name[0] != "_":
			program.emit(f".global {name}  # external symbol for proper linkage")

	if form == "define":
		name, value = sexpr[1:]

		if isinstance(name, list):  # is a procedure
			name = sexpr[1][0]
			extern_sym(name)
			define_proc([name, sexpr[1][1:], sexpr[2]], program, has_caller)
		else:
			extern_sym(name)
			global_vars.append(name)
			if isinstance(value, list):  # sexpr-defined value
				program.declare_var(name, 0)
				eval_lisp(value, program, has_caller)
				program.emit(f"mov [{name} + rip], rax")
			elif number_pattern.match(value):
				program.declare_var(name, value)  # constant value
			elif value in procedures:  # alias of predefined asm function
				program.declare_var(name, procedures[value].name)
			else:
				program.declare_var(name, value)  # atomic non-constant
				eval_lisp(["id", value], program)
				program.emit(f"mov [{name} + rip], rax")

	elif form == "set!":
		name, value = sexpr[1:]
		eval_lisp(value, program)
		program.emit(f"mov [{name} + rip], rax")

	elif form == "let":
		bound = sexpr[1]
		as_lambda = [["lambda", [b[0] for b in bound], sexpr[2]]] + [b[1] for b in bound]
		eval_lisp(as_lambda, program, has_caller)

	elif form == "if":
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

	elif form == "cond":
		cond_body = sexpr[1:]

		if isinstance(else_stmt := sexpr[-1], list) and else_stmt[0] == "else":
			cond_body[-1] = else_stmt[1]

		def cond_to_if(cond_body):
			curr = cond_body[0]
			if len(cond_body) == 1:
				return curr

			return ["if", curr[0], curr[1], cond_to_if(cond_body[1:])]

		eval_lisp(cond_to_if(cond_body), program, has_caller)

	elif form == "include":
		# why is infile accessible from here?
		to_include = sexpr[1].replace("\"", "").replace("'", "")
		tokens = list(parser.tokenize(to_include))
		while (tree := parser.parse(tokens)) is not None:
			eval_lisp(parser.replace_chars(tree), program, eval_proc = True)

	elif form == "define_macro":
		if isinstance(sexpr[1], str): name, args = sexpr[1], []
		else: name, args = sexpr[1][0], sexpr[1][1:]
		macros[name] = args, sexpr[2]

	elif form == "lambda":
		global lambda_id
		lambda_id += 1
		its_id = lambda_id

		program.emit(f"jmp after_anonymous_{its_id}")
		program.emit(f"anonymous_{its_id}:")
		program.emit("push rbp", "mov rbp, rsp")
		w_offsets = params_as_offsets(sexpr[2], sexpr[1])
		eval_lisp(w_offsets, program, False)
		program.emit("mov rsp, rbp", "pop rbp", "ret")
		program.emit(f"after_anonymous_{its_id}:", f"lea rbx, [anonymous_{its_id} + rip]")
		if has_caller: program.emit(f"push rbx  # push lambda #{lambda_id}")  # preserve rbx from division in the future

	elif form == "quote":
		""" Symbols cannot be printed at the moment because the `display` function
		only supports non-symbolic atoms and lists to be printed. """
		if (l := len(symbol := sexpr[1:])) > 1:
			raise SyntaxError(f"<quote> expects 1 argument, not {l}: {sexpr}")

		if not isinstance(symbol := sexpr[1], list):
			if symbol not in symbols:
				symbols.append(symbol)
				symbol_id = symbols.index(symbol) + 1
				program.declare_var(f"symbol_{symbol_id}", f"\"{symbol}\"", ".asciz")
			else:
				symbol_id = symbols.index(symbol) + 1
			program.emit(("push " if has_caller else "mov rax, ") + f"[symbol_{symbol_id} + rip]")
		else:
			def quote_list(symbol):
				for index, item in enumerate(symbol):
					if not isinstance(item, list):
						symbol[index] = ["quote", item]
					else:
						symbol[index] = quote_list(item)
				return ["list"] + symbol

			eval_lisp(quote_list(symbol), program)

	elif form == "begin":
		to_return = sexpr.pop()

		for expr in sexpr[1:]:
			eval_lisp(expr, program)

		if not isinstance(to_return, list):
			push_atomic_result(to_return, program, has_caller)
		else:
			eval_lisp(to_return, program, True)

	elif form == "asm":
		instructions = " ".join(sexpr[1:]).replace("\"", "").replace("'", "")
		program.emit(instructions + "  # Inline assembly insert")

def params_as_offsets(sexpr, params):
	for index, arg in enumerate(sexpr):
		if isinstance(arg, list):
			sexpr[index] = params_as_offsets(arg, params)
		elif arg in params:
			sexpr[index] = f"[rbp + {8 * (params.index(arg) + 1) + 8}]"
	return sexpr

def define_proc(sexpr, program, has_caller = False):
	name, params, body = sexpr
	make_procedure(name, len(params))

	program.defining_proc = True
	program.emit(f"{name}:", tab = False)
	program.emit("push rbp", "mov rbp, rsp")

	param_offsets = params_as_offsets(body, params)
	eval_lisp(param_offsets, program, eval_proc = True)
	program.emit("mov rsp, rbp", "pop rbp", "ret")
	program.defining_proc = False

def eval_lisp(sexpr, program,
			has_caller = False, eval_proc = False,
			compiling_if = False, register_call = False):

	procedure, args = sexpr[0], sexpr[1:]

	if isinstance(procedure, list):
		eval_lisp(procedure, program)
		eval_lisp(["rbx"] + args, program, has_caller, register_call = True)
		return

	elif procedure in special_forms:
		eval_special_form(sexpr, program, has_caller)
		return

	elif procedure in macros:
		macro = macros[procedure]
		expanded = expand_macro(macro[1], dict(zip(macro[0], sexpr[1:])))

		if isinstance(expanded, str):
			eval_lisp([expanded] + args, program, has_caller)
		else:
			eval_lisp(expanded, program, has_caller)
		return

	check_for_unbound_vars(sexpr)

	anonymous_f = False

	try:
		proc_obj = procedures[procedure]
		if len(args) != proc_obj.arg_length and proc_obj.name != "list":
			raise TypeError(f"Wrong argument count to procedure <{procedure}>: {sexpr}")
	except KeyError:
		anonymous_f = True

	for arg in args[::-1]:
		if isinstance(arg, list):
			eval_lisp(arg, program, True)
		else:
			if arg in global_vars:
				program.emit(f"push [{arg} + rip]  # push global variable")
			elif arg in procedures:
				arg = procedures[arg].name
				program.emit(f"lea rsi, [{arg} + rip]  # address of procedure {arg}", "push rsi")
			else:
				program.emit(f"push {arg}  # push argument to {procedure}")

	if procedure == "list":
		program.emit(f"mov r13, {(l := len(args))}  # list of length {l}")

	if register_call:
		to_call = procedure
	else:
		if anonymous_f:
			if procedure[0] == "[":
				program.emit(f"mov rsi, {procedure}")
				to_call = "rsi"
			else:
				to_call = f"[{procedure} + rip]"
		else:
			to_call = proc_obj.name

	program.emit(f"call {to_call}")

	if not eval_proc:
		plural = "" if (l := len(args)) == 1 else "s"
		discard_offset = l * 8
		program.emit(f"add rsp, {discard_offset}  # discard {l} local argument{plural}")

	if has_caller and not compiling_if:
		program.emit(f"push rax  # result of {procedure}")

def main(infile, outfile, extern):
	program = Program(extern)

	if not extern:
		program.emit("and rsp, -16")  # call _GC_enable_incremental

	tokens = list(parser.tokenize(infile))
	while (tree := parser.parse(tokens)) is not None:
		eval_lisp(parser.replace_chars(tree), program)

	if not extern:
		program.emit("xor rdi, rdi", "mov rax, 0x2000001", "syscall")
	program.export(outfile)

if __name__ == "__main__":
	infile, outfile, extern = "", "", False
	try:
		infile = argv[1]
		outfile = infile.rstrip("lisp") + "asm"
		if len(argv) >= 3:
			option = argv[2]

			if option == "debug":
				infile = "tests/" + infile; outfile = "tests/" + outfile
			elif option == "extern":
				extern = True
	except IndexError:
		print("Please provide a filename.")
	main(infile, outfile, extern)

"""
Working on right now:
- let bindings: https://en.wikipedia.org/wiki/Closure_(computer_programming)
- real symbols
- a more elegant random number generator

Feasible features:
Division
Floating-point math
-- Print names for symbols
Custom syntax highlighting
-- Comparing lists via equal?
-- Proper symbol interning (will yield uniqueness and print names)

One-day features:
pmatch
case

Compiler name:
RasmusLisp or rASMlisp
"""
