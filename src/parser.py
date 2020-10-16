def split_into_rows(code):
	def remove_comment(line):
		for char in line:
			if char != ";": yield char
			else: return

	for row in code:
		if (new_row := "".join(remove_comment(row))) != "":
			yield new_row

def split_into_exprs(code):
	expr_buf = ""
	l_parens, r_parens = 0, 0

	for char in " ".join(code):
		if char == "(":
			l_parens += 1
		elif char == ")":
			r_parens += 1

		expr_buf += char

		if l_parens == r_parens and l_parens != 0:
			yield expr_buf
			expr_buf = ""
			l_parens, r_parens = 0, 0

def tokenize_file(filename):
	with open(filename, "r") as file:
		str_contents = file.read()
		if str_contents.count("(") != str_contents.count(")"):
			raise SyntaxError("Unmatched parentheses")
		contents = str_contents.split("\n")

	for expr in split_into_exprs(split_into_rows(contents)):
		yield expr.replace("(", " ( ").replace(")", " ) ").split()

def parse(tokens):
	if not tokens: return
	if (curr := tokens.pop(0)) == "(":
		ast = []
		while tokens[0] != ")":
			ast.append(parse(tokens))
		tokens.pop(0)
		return ast
	else:
		return curr