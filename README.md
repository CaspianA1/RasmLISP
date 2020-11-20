![RasmLISP Logo](RasmLISP_Logo.png)

## RasmLISP is a Lisp compiler for x86_64 on macOS.
### There is exhaustive documentation for the standard library in _DOCUMENTATION.md_.
#### Any questions are welcome at _rasmlisp@gmail.com_.

Here is how to try out RasmLISP (when using the build system that provides easy linking with the standard library):

- Install dependencies via `make install`.
- Type `make` into your terminal. That will use the _test.lisp_ file in the _tests_ directory.
- The garbage collector and the lisp runtime library are compiled properly.
- The compiler is run in debug mode, meaning that the input file (the first argument to it) will be in _tests_. It can also be run in _extern_ mode (the second flag) to avoid an entry point (`_main`).
- `parser.py` tokenizes and parses the code. Each S-expression is fed into the main function `eval_lisp` in `compiler.py`. You can take a peek at that if you want to see how it works.
- Once compilation is done the output file is _tests/test.asm_. The assembler configured in the Makefile will generate a binary, properly linked with the library, in _out_.
- To run your output file just type `make run`.

If you want to try out a pre-written program, I have a demo of Conway's Game of Life in the _tests_ directory. It uses the curses library (you can read more about the curses bindings in _DOCUMENTATION.md_). Simply copy its contents into _tests/test.asm_, and follow the steps above to run the code.