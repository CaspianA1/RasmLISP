(define (display_list x)
	(if (null? x) 0
		(begin
			(if (list? (car x))
					(display_list (car x))
					(display (car x)))
			(display_list (cdr x)))))

(display_list '(1 2 (3 4) 5))


; print the needed spaces and parentheses
(define (display_list_2 x)
	(if (null? x) 0
		(begin
			(if (list? (car x))
					(display_list (car x))
					(display (car x)))
			(display_list (cdr x)))))