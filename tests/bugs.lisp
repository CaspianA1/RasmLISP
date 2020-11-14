; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Map and filter do not behave as expected
; (define sequence (cons 1 2)); no mutation
; (define sequence (cons 1 (cons 2 3))); no mutation
(define sequence (cons 1 (cons 2 (cons 3 4)))); other problems
(define incremented (map add1 sequence))
(display_list tripled); this works half of the time (except for fhe first element)
; (newline)
; (display_list sequence)

| Why does nums change here?
(define nums (cons 1 (cons 2 (cons 3 (cons 4 5)))))
(define incremented (map (lambda (x) (+ x 1)) nums))
(display_list incremented)
(newline)
(display_list nums)
|

; filters correctly, but has an extra null ending
; destroys nums
(define filter_test (filter (lambda (x) (> x 3)) nums)); this destroys nums
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;