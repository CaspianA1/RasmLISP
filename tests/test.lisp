(define (display_lat lst)
	(if (null? lst) 0
		(begin
			(display_num (car lst))
			(display_lat (cdr lst)))))

(display_lat (list_of 4 5 6))