(include "lib/constants.lisp")

(define (null? x) (eq? x nil))
(define (atom? x) (and (<= x MAX_NUM) (not (null? x))))

(define (list? x) (not (atom? x)))

(define (lat? lst)
	(cond
		((null? lst) 1)
		((list? (car lst)) 0)
		(else (lat? (cdr lst)))))