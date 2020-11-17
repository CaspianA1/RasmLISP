## This is documentation for the RasmLISP compiler (targeting x86_64).

### Efficiency:
- I have not had the chance to compare my output's speed compared to C.
- However, I have noticed that for many examples, the line length of the output assembly code size produced is around half of Clang's. That may be a good sign!

### Tools:
- I am using the LLVM backend for assembling and debugging, specifically `clang` and `lldb`.
- The outputted `.asm` file is in `x86-64` assembly, with `intel` syntax, and made for MacOS; but a few small changes should make it compatible with Linux as well.
- I am using [this](https://github.com/jserv/ogc) garbage collector for lists (they are the only data structure allocated on the heap).

### Special forms implemented so far:
#### `define`
- If an expression is a literal constant, it is stored as a 64-bit integer in the `.data` section.
- Else, it is initialized to zero and evaluated at runtime.
- If the first argument is a list, e.g. `(define (f x) (+ x 1))`, `f` is stored as a function, or more appropriately a label, in the outputted `.asm` file.
- Compile-time checking for argument count and unbound symbol checking has been implemented as well.
- Recursion is up and running.
#### `set!`
- Modifies a variable to a given value.
#### `if`
- `if` statements can be nested and sequential.
- It may be hard to follow the flow control looking at the outputted `.asm` file (as assembly flow control is essentially glorified `goto`s) but it has been tested exhaustively. Do not worry!)

#### `cond`
- If `if` statements are if-else, `cond` statements are if-elif-else. Here's an example:

```scheme
> (define x (* 2 3))
> (display
	(cond
		((eq? x 5) 1)
		((eq? x 6) 2)
		(else 3))); else here is just syntactic sugar - it isn't necessary
2
```

#### `include`
- Imports a file from the relative path of the importer.
#### `define_macro`
- Declares an unhygenic macro. Its form is parallel to `define`, like this: `(define_macro (add a b c) (+ a b c))`
#### `begin`
- `begin` acts a little bit like a monad. It allows you to chain impure computations together in a single block, with the last s-expression's value being returned. Here's an example:

```scheme
(display_num
	(begin
		(newline)
		(display_num 25)
		(+ 3 2)))
```

#### `lambda`
- Constructs an anonymous function with two parts: a parameter list and a body. Here's an example: `(lambda (x y) (+ x y))`

#### `let`
- These are technically done; but until lambdas can capture their surrounding environment the resulting expression body cannot access other bound variables than those bound by the current `let`.

#### `quote`
- Converts a string into a compile-time constant hash that can be used for quick comparisons via `eq?`. The resulting symbol is uninterned and has no print name.

### Built-in procedures:
#### List primitives:
- `car`, `cdr`, `cons`
#### Operators, two arguments:
- `+`, `-`, `*`, `eq?`, `and`, `or`, `>`, `>=`, `<`, `<=`
#### Operators, one argument:
- `not`, `atom?`, `list?`, `null?`, `add1`, `sub1`, `id`
#### Impure procedures:
- `display` (type-independent, excluding characters), `display_num`, `display_char`, `display_list`, `newline`
#### Error handling:
- You can throw an error by calling `type_exception` or `value_exception`. Pass either function a unique number to help you find out who threw the error.
#### Other:
- `length`, `sum`, `max`, `reverse`, `append`, `flatten`, `map`, `filter`, `reduce`, `lat?`
#### Eventual features:
- I'll get to division and floating-point arithmetic, and symbol print names sometime soon.
- If I have time I would like to implement a pattern-matching system and an ability to call C functions.

### curses bindings:
- To start using curses, call `start_curses`. Deinitialize the library with `end_curses`.
- curses colors are based around a concept of color pairs. A pair has a foreground and background color (from 1 to 8) and is associated with a number in the same range. Initialize a pair like this:
`(init_color 1 2 3)`. This initializes color pair 1 with a foreground color of 2 and a background color of 3.
- To turn color pair 1 on, do this: `(activate_color 1)`. Turn it off with `deactivate_color`.
- `readch` returns a number representing the ASCII code of the character pressed. To print a character to the screen, call `printscr`, which takes a y-coordinate, an x-coordinate, and a character to print.
- Call `refresh` to see whatever has been recently printed. `clear` will erase everything on the screen.
- Special keys: `KEY_UP`, `KEY_DOWN`, `KEY_LEFT`, `KEY_RIGHT`, `KEY_ENTER`
- These may be returned by `readch`.

### Miscellaneous:
- The maximum integer size is 2,147,483,647. Anything larger used is susceptible to undefined behavior.
- Multi-line comments are done with these: `|`
- Characters are a bit different in Lisp. Instead of `a` looking like `'a'`, it would look like `#\a`. Special characters, like `'\n'`, look like this: `#\newline`.