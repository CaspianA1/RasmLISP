; (include "lib/lib.lisp")

;;;;;;;;;;
|
(define (list? x) (not (atom? x)))

(define (_display_list x)
	(if (null? x) (begin (display_char #\backspace) (display_char #\)) 0)
		(begin
			(if (list? (car x))
				(begin (display_char #\() (_display_list (car x)))
				(display_num (car x)))
			(display_char #\space)
			(_display_list (cdr x)))))

(define (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))

(define (map f lst)
	(if (null? lst) lst; '\0'
		(cons (f (car lst)) (map f (cdr lst)))))

(display_num (quote nil))
(newline)

(define sequence (cons 1 (cons 2 (cons 3 4))))
(display_list (map add1 (cons 7 (cons 8 (cons 9 10))))); 1st element = incorrect
(newline)
(display_list sequence); sequence is changed
|