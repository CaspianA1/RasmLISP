# what about quoted comments?
def remove_comments(chars):
	def single_line(chars):
		removing_comments = False
		for char in chars:
			if char == ";":
				removing_comments = True
			elif not removing_comments:
				yield char
			if char == "\n":
				removing_comments = False

	def multiline(chars):
		removing_comments = False
		for char in chars:
			if char == "|":
				removing_comments = not removing_comments
			elif not removing_comments:
				yield char

	return "".join(single_line(multiline(chars)))

def tokenize(filename):
	with open(filename, "r") as file:
		comment_free = remove_comments(file.read())
	tokens = comment_free.replace("(", " ( ").replace(")", " ) ").split()

	next_skip = False
	for index, token in enumerate(tokens):
		if next_skip:
			next_skip = False
			continue
		elif token == "#\\":
			if (paren_char := tokens[index + 1]) in "()":
				yield token + paren_char
				next_skip = True
		else:
			yield token

def parse(tokens):
	if not tokens: return
	if (curr := tokens.pop(0)) == "(":
		ast = []
		while tokens[0] != ")":
			ast.append(parse(tokens))
		tokens.pop(0); return ast
	else: return curr

def replace_chars(ast):
	for index, node in enumerate(ast):
		if isinstance(node, list):
			ast[index] = replace_chars(node)
		elif node.startswith("#\\"):
			substitute = node[2:]

			replacements = {"newline": "'\n'", "space": "' '", "backspace": "'\b'"}
			ast[index] = replacements.get(substitute, f"'{substitute}'")

	return ast