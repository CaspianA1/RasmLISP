## This is a Lisp compiler for x86_64 on MacOS.
### There is exhaustive documentation for the standard library in `DOCUMENTATION.md`.

Here is how RasmLISP works (when using the build system that provides easy linking with the standard library):

- You type `make` into your terminal. That will use the `test.lisp` file in the `tests` directory.
- The garbage collector (not used at the moment) and the lisp runtime library are compiled properly.
- The compiler is run in debug mode, meaning that the input file (the first argument to it) will be in the `tests` directory. It can also be run in extern mode (the second flag) to avoid an entry point (`_main`).
- `parser.py` tokenizes and parses the code. Each s-expression is fed into the main function `eval_lisp` in `compiler.py`. You can take a peek at that if you want to see how it works.
- Once compilation is done the output file is `tests/test.asm`. The proper library files will have been linked with that.
- To run your output file just type `make run`.