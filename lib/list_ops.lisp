;;;;;;;;;;
(define (map f lst)
	(if (null? lst) lst; what indicates an ending?
		(cons (f (car lst)) (map f (cdr lst)))))

(define (filter f lst)
	(if (null? lst) lst
		(if (f (car lst))
			(cons (car lst) (filter f (cdr lst)))
			(filter f (cdr lst)))))

(define (reduce f lst seed)
	(if (null? lst) seed
		(f (car lst) (reduce f (cdr lst) seed))))
;;;;;;;;;;
(define (_display_list x)
	(if (null? x) (begin (display_char #\backspace) (display_char #\)) 0)
		(begin
			(if (list? (car x))
				(begin (display_char #\() (_display_list (car x)))
				(display_num (car x)))
			(display_char #\space)
			(_display_list (cdr x)))))

(define (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;
(define (_length lst counter)
	(if (null? lst) counter
		(_length (cdr lst) (add1 counter))))
(define (length lst) (_length lst 0))
;;;;;;;;;;
(define (_sum lst accum)
	(if (null? lst) accum
		(_sum (cdr lst) (+ accum (car lst)))))
(define (sum lst) (_sum lst 0))
;;;;;;;;;;
(define (_max lst curr)
	(if (null? lst) curr
		(if (> (car lst) curr) (_max (cdr lst) (car lst))
			(_max (cdr lst) curr))))
(define (max lst) (_max lst (car lst)))
;;;;;;;;;;