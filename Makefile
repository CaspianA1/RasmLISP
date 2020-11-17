CC = clang
OUT = test
LINK_WITH = lib/lib.asm /usr/local/bin/lib/libgc.dylib
CFLAGS = -O0 -lncurses -masm=intel $(LINK_WITH) -o out/$(OUT) tests/$(OUT).asm
DEBUGGER = lldb

all: compile assemble
compile:
	python3 src/compiler.py test.lisp debug
assemble: compile_gc compile_lisp_lib
	$(CC) $(CFLAGS)
compile_gc:  # the garbage collector
	# $(CC) -O0 -S -masm=intel -o lib/GC/gc.asm lib/GC/gc.c
compile_lisp_lib:
	python3 src/compiler.py lib/lisp_lib.lisp extern
debug:
	$(CC) -g $(CFLAGS)
	$(DEBUGGER) out/$(OUT) || echo Please install $(DEBUGGER) before debugging.
run:
	./out/$(OUT)
clean:
	rm -r out/*
install:
	# brew install python || echo Please install Homebrew first.
	# xcode-select --install  # clang + lldb
	# sh install_boehm.sh
	# $(CC) -O0 /usr/local/bin/lib/libgc.dylib -o lib/GC/gc_wrapper.asm -S -masm=intel lib/GC/gc_wrapper.c  # test