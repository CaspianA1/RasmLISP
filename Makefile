CC = clang
OUT = test
LINK_WITH = lib/lib.asm
CFLAGS = -masm=intel -o out/test tests/$(OUT).asm $(LINK_WITH)

full: compile assemble

compile:
	python3 src/compiler.py test.lisp debug
assemble:
	$(CC) $(CFLAGS)

run: full
	./out/$(OUT)