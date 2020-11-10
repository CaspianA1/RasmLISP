CC = clang
OUT = test
CFLAGS = -O0 -masm=intel lib/lib.asm -o out/$(OUT) tests/$(OUT).asm
DEBUGGER = lldb

all: compile assemble
compile:
	python3 src/compiler.py test.lisp debug
assemble: compile_gc
	$(CC) $(CFLAGS)
compile_gc:  # the garbage collector
	$(CC) -O0 -S -masm=intel -o lib/GC/gc_wrapper.asm lib/GC/gc_wrapper.c
debug:
	$(CC) -g $(CFLAGS)
	$(DEBUGGER) out/$(OUT) || echo Please install $(DEBUGGER) before debugging.
run:
	./out/$(OUT)
clean:
	rm -r out/$(OUT).dSYM
install:
	brew install python || echo Please install Homebrew first.
	xcode-select --install  # clang + lldb