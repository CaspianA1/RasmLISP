(define (list? x) (not (atom? x)))

(define (lat? lst)
	(if (null? lst) 1
		(if (list? (car lst)) 0
			(lat? (cdr lst)))))