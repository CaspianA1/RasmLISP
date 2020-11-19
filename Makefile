CC = clang
OUT = test
LINK_WITH = lib/lib.asm /usr/local/bin/lib/libgc.dylib
CFLAGS = -O0 -lncurses -masm=intel $(LINK_WITH) -o out/$(OUT) tests/$(OUT).asm
DEBUGGER = lldb

all: compile assemble
compile:
	python3 src/compiler.py test.lisp debug
assemble: compile_lisp_lib
	$(CC) $(CFLAGS)
compile_lisp_lib:
	python3 src/compiler.py lib/lisp_lib.lisp extern
debug:
	$(CC) -g $(CFLAGS)
	$(DEBUGGER) out/$(OUT) || echo Please install $(DEBUGGER) before debugging.
run:
	./out/$(OUT)
r:
	clear && printf '\e[3J'; make && (make run || (reset; echo "A crash occured."))
clean:
	rm -r out/*
install:
	brew install python || echo Please install Homebrew first.
	xcode-select --install  # clang + lldb
	sh install_boehm.sh