class Program:
	main = ["\t.global _main\n\t.text\n_main:"]
	procedures = []
	variables = ["\n\t.data"]
	defining_proc = False

	def emit(self, *instructions, tab = True, word = False):  # what is word here?
		section = self.procedures if self.defining_proc else self.main
		for i in instructions:
			section.append("\t" * tab + i)
	def declare_var(self, name, val):
		self.variables.append(f"{name}:\n\t.quad {val}")
	def export(self, filename):
		with open(filename, "w") as outfile:
			for section in self.main, self.procedures, self.variables:
				for instruction in section:
					outfile.write(f"{instruction}\n")

class Procedure:
	def __init__(self, name, arg_length):
		self.name = name
		self.arg_length = arg_length

procedures = {}

##########
def make_procedure(name, args):
	procedures[name] = Procedure(name, args)

for zero_arg_proc in ("newline", "list"):
	make_procedure(zero_arg_proc, 0)

for one_arg_proc in ("display", "display_num", "display_list", "display_char",
	"car", "cdr", "atom?", "list?", "null?", "id", "add1", "sub1",
	"type_exception", "value_exception"):
	make_procedure(one_arg_proc, 1)

for two_arg_proc in ("cons", "eq?"):
	make_procedure(two_arg_proc, 2)
##########
def make_operator(lisp_name, asm_name):
	procedures[lisp_name] = Procedure(asm_name, 2)

make_operator("+", "plus")
make_operator("-", "minus")
make_operator("*", "multiply")
make_operator("and", "bool_and")
make_operator("or", "bool_or")
procedures["not"] = Procedure("bool_not", 1)
make_operator(">", "greater")
make_operator(">=", "greater_eq")
make_operator("<", "smaller")
make_operator("<=", "smaller_eq")
##########