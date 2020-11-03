; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define (list? x) (not (atom? x)))

(define (print_list lst)
	(if (null? lst) 0
		(if (list? (car lst))
			(print_list (car lst))
			(begin
				(display_num (car lst))
				(newline)
				(print_list (cdr lst))
		 )

		)
	))

(define numbers (list_of 1 2 3))
(print_list numbers)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define test_list (list_of 4 (list_of 5 6 (list_of 7 8)) 9))
(define test_list (list_of 4 (list_of 5 6) 8))
(display_a_list test_list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define x (list_of 1))
(display_list x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; No lambdas:
(define (x) (lambda (a b) (+ a b)))
(define y (x))
(display_num (y 2 3))

(define (map f lst)
	(if (null? lst) lst
		(list_of (f (car lst)) (map f (cdr lst)))))
(define (add_x_y x y) (+ x y))
(map add_x_y (list_of 3 4 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)

(define (map_add1 lst)
	(if (null? lst) lst
		(list_of (add1 (car lst)) (map_add1 (cdr lst)))))

(define x (map_add1 (list_of 7 8 9 10)))
(display_num (car (cdr (cdr x))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Map_add1:
; The produced list structure is not correct
(define (map_add1 lst)
	(if (null? lst) lst
		(list_of (add1 (car lst)) (map_add1 (cdr lst)))))
(display_a_list (map_add1 (list_of 7 8)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define (list? x) (not (atom? x)))

(define (display_lat lst)
	(if (null? lst) 0
		(begin
			(display_num (car lst))
			(display_lat (cdr lst))
			)
		))

(display_lat (list_of 4 5 6))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;