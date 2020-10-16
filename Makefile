CC = clang
OUT = test
LINK_WITH = lib/lib.asm
LINK = $(LINK_WITH) -o out/$(OUT) tests/$(OUT).asm
CFLAGS = -O0 -mstackrealign -masm=intel $(LINK)

all:  # compiler + assembler
	python3 src/compiler.py
	make build  # must go after running the compiler
build:  # assembler
	$(CC) $(CFLAGS)
run:  # runs output binary
	./out/$(OUT)
debug:  # build with gdb flags, and opens gdb
	$(CC) -g3 -ggdb $(CFLAGS)
	gdb out/$(OUT)
verify: build 
	# Sees that binary output is expected
	# Assumes an installation of Chez Scheme
	if [ "`chez --script tests/test.lisp`" = "`./out/test`" ]; then \
		echo "You have the expected output!"; \
	else echo "Your binary does not run as expected."; fi
clean:  # removes all binaries from /out
	rm out/$(OUT)
	rm -r out/*.dSYM