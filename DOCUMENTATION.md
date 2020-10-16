## This is documentation for my Lisp compiler that targets the x86-64 architecture.

### Effeciency:
- I have not had the chance to compare my output's speed compared to C.
- However, I have noticed that for many examples, the line length of the output assembly code size produced is around half of Clang's. That may be a good sign!

### Special forms implemented so far:
#### `define`
- If an expression is a literal constant, it is stored as a 64-bit integer in the `.data` section.
- Else, it is initialized to zero and evaluated at runtime.
- If the first argument is a list, e.g. `(define (f x) (+ x 1))`, `f` is stored as a function, or more appropriately a label, in the outputted `.asm` file.
- Compile-time checking for argument count and unbound symbol checking has been implemented as well.
- Recursion is up and running.
### `if`
- `if` statements can be nested and sequential.
- It may be hard to follow the flow control looking at the outputted `.asm` file (as assembly flow control is essentially glorified `goto`s) but it has been tested exhaustively. Do not worry!)
### `include`
- Imports a file from the relative path of the importer.

### Built-in procedures:
#### Operators, two arguments:
- `+`, `-`, `*`, `=`, `and`, `or`
#### Operators, one argument:
- `not`
#### Eventual features:
- I'll get to division and floating-point arithmetic sometime soon.
#### Impure procedures:
- `display`, `newline`