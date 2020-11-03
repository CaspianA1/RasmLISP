(define (map f lst)
	(if (null? lst) lst
		(cons (f (car lst)) (map f (cdr lst)))))

(define (_max lst curr)
	(if (null? lst) curr
	  (if (> (car lst) curr) (_max (cdr lst) (car lst))
		(_max (cdr lst) curr))
	))

(define (maxx lst) (_max lst (car lst)))
(display (maxx '(4  29 20 39 48 82 8457 20 190 1 0 0)))