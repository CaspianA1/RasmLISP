(include "lib/lib.lisp")
(define_macro (seq x) (list_of 1 x 3))
(display (seq 32))