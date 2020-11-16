;;;;;;;;;;
(define (map f lst)
	(if (null? lst) lst
		(cons (f (car lst)) (map f (cdr lst)))))

(define (filter f lst)
	(cond
		((null? lst) lst)
		((f (car lst)) (cons (car lst) (filter f (cdr lst))))
		(else (filter f (cdr lst)))))

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
	(if (null? x)
		(begin (display_char #\( ) (display_char #\) ))
		(begin
			(display_char #\()
			(_display_list x))))
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
	(cond
		((null? lst) curr)
		((> (car lst) curr) (_max (cdr lst) (car lst)))
		(else (_max (cdr lst) curr))))

(define (max lst) (_max lst (car lst)))
;;;;;;;;;;
(define (_reverse lst buf)
	(if (null? lst) buf
		(_reverse (cdr lst) (cons (car lst) buf))))
(define (reverse lst) (_reverse lst #\\0))
;;;;;;;;;;
(define (append lst1 lst2)
	(if (null? lst1) lst2
		(cons (car lst1) (append (cdr lst1) lst2))))
;;;;;;;;;;
(define (flatten lst)
	(cond
		((null? lst) lst)
		((list? (car lst))
			(flatten (append (car lst) (flatten (cdr lst)))))
		(else (cons (car lst) (flatten (cdr lst))))))