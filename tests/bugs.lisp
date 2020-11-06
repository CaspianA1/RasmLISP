; Bugs:

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
(define (higher_order f a) (f a))
(higher_order (lambda (x) (+ x 1)) 2)
; Having a lambda assigned to its name when passed is okay, but when anonymous it segfaults
; Commenting out the body of the lambda removes the error

#|
* thread #1, queue = 'com.apple.main-thread', stop reason = instruction step over
    frame #0: 0x0000000100003dab test`higher_order + 11
test`higher_order:
->  0x100003dab <+11>: call   rsi
    0x100003dad <+13>: mov    rsp, rbp
    0x100003db0 <+16>: pop    rbp
    0x100003db1 <+17>: ret
Target 0: (test) stopped.
(lldb) ni
Process 26532 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=2, address=0x7ffeefbff690)
    frame #0: 0x00007ffeefbff690
Target 0: (test) stopped.
(lldb) bt
|#
; The problem is in lambda_1 (use GDB and some sleuthing to see what's getting passed into it)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define (fun f) 5)
(display_num (fun 6))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;