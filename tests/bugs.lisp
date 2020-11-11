; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define x (list_of 1))
(display_list x)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Doesn't work yet:
(define (map f lst)
	(if (null? lst) lst
		(cons
			(f (car lst))
			(map f (cdr lst)))))
(define new (map add1 (list 1 2 3 4 5))) ;(cons 1 (cons 2 (cons 3 (cons 4 5))))))
(display new)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Map_add1:
; The produced list structure is not correct
(define (map_add1 lst)
	(if (null? lst) lst
		(list_of (add1 (car lst)) (map_add1 (cdr lst)))))
(display_a_list (map_add1 (list_of 7 8)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;