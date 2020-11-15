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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;