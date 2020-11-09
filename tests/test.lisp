(include "lib/lib.lisp")
(define x (list_of 1 2))
(define y (list_of 3 4 x)); incorrect
(display_list y)