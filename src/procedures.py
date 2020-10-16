class Program:
	main = ["\t.global _main\n\t.text\n_main:"]
	procedures = []
	variables = ["\n\t.data"]
	defining_proc = False
	
	def emit(self, *instructions, tab = True, word = False):
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
	def __init__(self, name, arguments):
		self.name = name
		self.arguments = arguments

procedures = {}

##########
def make_procedure(name, args):
	procedures[name] = Procedure(name, args)

make_procedure("display", ["x"])
make_procedure("newline", [])
##########
def make_operator(lisp_name, asm_name):
	procedures[lisp_name] = Procedure(asm_name, ["a", "b"])

make_operator("+", "plus")
make_operator("-", "minus")
make_operator("*", "multiply")
make_operator("=", "equal")
make_operator("and", "bool_and")
make_operator("or", "bool_or")
procedures["not"] = Procedure("bool_not", ["x"])
##########