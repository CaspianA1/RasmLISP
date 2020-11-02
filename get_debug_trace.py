debug_rows = []
while True:
	row = input("> ")
	if row == "q":
		break
	debug_rows.append(row)

for row in debug_rows:
	if "frame" in row:
		print(row[row.index("test") + 5:])