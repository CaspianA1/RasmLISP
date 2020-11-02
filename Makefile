CC = clang
OUT = test
LINK_WITH = lib/lib.asm
CFLAGS = -masm=intel $(LINK_WITH) -o out/test tests/$(OUT).asm

all: compile assemble
compile:
	python3 src/compiler.py test.lisp debug
assemble:
	$(CC) $(CFLAGS)
debug:
	$(CC) -g $(CFLAGS)
	lldb out/$(OUT) || echo "Please install LLDB before debugging."
	# gdb -q out/$(OUT) || echo "Please install GDB before debugging."
run:
	./out/$(OUT)
clean:
	rm -r out/$(OUT).dSYM