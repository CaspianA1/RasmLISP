## This is documentation for my Lisp compiler that targets the x86-64 architecture.

### Efficiency:
- I have not had the chance to compare my output's speed compared to C.
- However, I have noticed that for many examples, the line length of the output assembly code size produced is around half of Clang's. That may be a good sign!

### Tools:
- I am using the LLVM backend for assembling and debugging, specifically `clang` and `lldb`.
- The outputted `.asm` file is in `x86-64` assembly, with `intel` syntax, and made for MacOS; but a few small changes should make it compatible with Linux as well.

### Special forms implemented so far:
#### `define`
- If an expression is a literal constant, it is stored as a 64-bit integer in the `.data` section.
- Else, it is initialized to zero and evaluated at runtime.
- If the first argument is a list, e.g. `(define (f x) (+ x 1))`, `f` is stored as a function, or more appropriately a label, in the outputted `.asm` file.
- Compile-time checking for argument count and unbound symbol checking has been implemented as well.
- Recursion is up and running.
#### `if`
- `if` statements can be nested and sequential.
- It may be hard to follow the flow control looking at the outputted `.asm` file (as assembly flow control is essentially glorified `goto`s) but it has been tested exhaustively. Do not worry!)
#### `include`
- Imports a file from the relative path of the importer.
#### `define_macro`
- Declares an unhygenic macro. Its form is parallel to `define`, like this: `(define_macro (add a b c) (+ a b c))`
#### `begin`
- `begin` acts a little bit like a monad. It allows you to chain impure computations together in a single block, with the last s-expression being returned. Here's an example:

```
(display_num
	(begin
		(newline)
		(display_num 25)
		(+ 3 2)
		)
	)
```

### Built-in procedures:
#### List primitives:
- `car`, `cdr`, `list_of`
- `display_list` is a work in progress.
#### Operators, two arguments:
- `+`, `-`, `*`, `=`, `and`, `or`, `>`, `>=`, `<`, `<=`
#### Operators, one argument:
- `not`, `atom?`, `list?`, `null?`, `add1`, `sub1`
#### Impure procedures:
- `display_num`, `display_list`, `newline`
#### Other:
- `length`, `sum`, `max`
#### Eventual features:
- I'll get to division and floating-point arithmetic sometime soon.
- The same goes for symbols, printing lists, and higher-order functions.
- If I have time I would like to implement anonymous functions, a pattern-matching system and an ability to call C functions.

### Miscellaneous:
- The maximum integer size is 2,147,483,647. Anything larger used is susceptible to undefined behavior.
- Multi-line comments are done with curly braces.