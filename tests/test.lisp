(define (print_list lst)
	(if (null? lst) 0
		(if (list? (car lst))
			(print_list (car lst))
			(begin
				(display_num (car lst))
				(newline)
				(print_list (cdr lst))
		 )

		)
	)