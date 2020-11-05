;;;;;
(define (list? x) (not (atom? x)))
;;;;;
{
(define (display_list x)
	(if (null? x) 0
		(begin
			(if (list? (car x))
				(display_list (car x))
				(display_num (car x)))
			(display_list (cdr x)))))
}

;;;;;
(define (_length lst counter)
	(if (null? lst) counter
		(_length (cdr lst) (add1 counter))))
(define (length lst) (_length lst 0))
;;;;;
(define (_sum lst accum)
	(if (null? lst) accum
		(_sum (cdr lst) (+ accum (car lst)))))
(define (sum lst) (_sum lst 0))
;;;;;
(define (_max lst curr)
	(if (null? lst) curr
		(if (> (car lst) curr) (_max (cdr lst) (car lst))
			(_max (cdr lst) curr))))
(define (max lst) (_max lst (car lst)))
;;;;;
(define (reduce proc lst init); not working
	(if (null? lst) init
		(proc (car lst) (reduce proc (cdr lst) init))))
;;;;;
; later, precompile this, call it `helper_functions.lisp`, and link it with `lib.asm