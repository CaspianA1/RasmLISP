; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Function + not translated to its proper name:
(define nums (cons 1 (cons 2 3)))
(define x (reduce + nums))
(display nums)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Append problems (segfault)
(display (append (cons 1 2) (cons 3 4))); works
(display (append (cons 1 2) (cons (cons 3 4) 4))); doesn't work
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (plusplus x y) (+ x y))
; (define plusplus (lambda (x y) (+ x y))); diff printouts from these 2
(define nums (cons 1 (cons 2 3)))
(define x (reduce plusplus nums)); it's creating some pointers (since it's printing out 2 parens first)
(display x)
; not working: reduce, reverse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
(define inverted (reverse (cons 1 (cons 2 (cons 3 (cons 4 5))))))
(display inverted)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;