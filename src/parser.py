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
			if char == "{":
				removing_comments = True
			elif char == "}":
				removing_comments = False
			elif not removing_comments:
				yield char

	return "".join(single_line(multiline(chars)))

def report_errors(rows):
	wout_chars = "".join(rows).replace("'('", "").replace("')'", "")
	if wout_chars.count("(") != wout_chars.count(")"):
		raise SyntaxError("Unmatched parentheses")

def rejoin_parens(tokens: list):
	new_tokens = []
	skip_amt = 0
	for index, token in enumerate(tokens):
		if skip_amt > 0:
			skip_amt -= 1
			continue
		elif token == "'":
			new_tokens.append("".join(tokens[index: index + 3]))
			skip_amt = 2
		else:
			new_tokens.append(token)

	return new_tokens


def tokenize(filename):
	with open(filename, "r") as file:
		comment_free = remove_comments(chars := file.read())
		report_errors(comment_free)
		return rejoin_parens(comment_free
					.replace("(", " ( ")
					.replace(")", " ) ")
					.split())

def parse(tokens):
	if not tokens: return
	if (curr := tokens.pop(0)) == "(":
		ast = []
		while tokens[0] != ")":
			ast.append(parse(tokens))
		tokens.pop(0); return ast
	else: return curr