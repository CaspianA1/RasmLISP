(include "lib/constants.lisp")

(define (atom? x) (and (<= x MAX_NUM) (not (eq? x nil))))
(define (list? x) (not (atom? x)))

(define (lat? lst)
	(cond
		((null? lst) 1)
		((list? (car lst)) 0)
		(else (lat? (cdr lst)))))