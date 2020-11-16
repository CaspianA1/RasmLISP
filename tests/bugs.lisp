; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Incorrect results:
(define (g a) (let ((b 3) (c 4)) (* a (* b c))))
(display (g 2))
(newline)

(define (f a) ((lambda (b c) (* a (* b c))) 3 4))
(display (f 2)); weird! both are wrong. both are 36 when they should be 24.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;