(include "lib/predicates.lisp")
(include "lib/list_ops.lisp")

(define (display var)
	(if (atom? var)
		(display_num var)
		(display_list var)))