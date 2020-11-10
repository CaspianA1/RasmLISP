; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define x (list_of 1))
(display_list x)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define (map f lst)
	(if (null? lst) lst
		(list_of (f (car lst)) (map f (cdr lst)))))
(define (add_x_y x y) (+ x y))
(display_list (map add_x_y (list_of 3 4 5)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Map_add1:
; The produced list structure is not correct
(define (map_add1 lst)
	(if (null? lst) lst
		(list_of (add1 (car lst)) (map_add1 (cdr lst)))))
(display_a_list (map_add1 (list_of 7 8)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Infinite print:
(display_list (list_of 1 (list_of 2 3) (list_of 4 5)))
(display_list (list_of 1 (list_of 2 3) (list_of 4 5)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Half of the time buggy:
(display_list (list_of 1 (list_of 2 3) (list_of 4 5)))
(display (list_of 1 (list_of 2 3) 4 (list_of 5 6)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; But why does this work then:
(display (list_of (list_of 2 3) (list_of 4 5)))
(display (list_of 1 (list_of 2 3) (list_of 4 5) 6))
(display (list_of 1 2 3))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;