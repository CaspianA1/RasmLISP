(include "lib/constants.lisp")

; (define (atom? x) (and (<= x MAX_NUM) (not (eq? x nil))))
; (define (atom? x) (<= x MAX_NUM))

(define (list? x) (not (atom? x)))

(define (lat? lst)
	(if (null? lst) 1
		(if (list? (car lst)) 0
			(lat? (cdr lst)))))