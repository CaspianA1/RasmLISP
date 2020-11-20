; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Incorrect results:
(define (g a) (let ((b 3)) (* a b)))
(display (g 2))
(newline)

(define (f a) ((lambda (b) (* a b)) 3))
(display (f 2)); Weird! Both are wrong. Both are 9 when they should be 6.
; For this to work, that lambda has to be able to capture its surrounding environment.
; 1. How would it do that?
; 2. What is making it behave not as expected right now? (or why is it squaring the first argument?)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't print results from rand32 (segfault)