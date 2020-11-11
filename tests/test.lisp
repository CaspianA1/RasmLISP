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


(define (map proc lst)
	(if (null? lst) lst; what indicates an ending?
		(cons (proc (car lst)) (map proc (cdr lst)))))

(define seq (cons 11 (cons 12 13)))
(define result (map (lambda (x) (* x x)) seq))
(display_list result)