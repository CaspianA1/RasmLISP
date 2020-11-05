CC = clang
OUT = test
CFLAGS = -masm=intel lib/lib.asm -o out/$(OUT) tests/$(OUT).asm
DEBUGGER = lldb

all: compile assemble
compile:
	python3 src/compiler.py test.lisp debug
assemble:
	$(CC) $(CFLAGS)
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