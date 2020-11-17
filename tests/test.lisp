(display (list 10 10))
|
(start_curses)

(define (change_y input y_pos)
	(cond
		((eq? input KEY_UP) (sub1 y_pos))
		((eq? input KEY_DOWN) (add1 y_pos))
		(else y_pos)))

(define (change_x input x_pos)
	(cond
		((eq? input KEY_LEFT) (sub1 x_pos))
		((eq? input KEY_RIGHT) (add1 x_pos))
		(else x_pos)))

(define (drawing_program input pos)
	(if (eq? input #\q) 0
		(begin
			(printscr (car pos) (car (cdr pos)) #\*)
			(drawing_program (readch)
				(cons
					(change_y input (car pos))
					(change_x input (car (cdr pos))))))))

(drawing_program KEY_RIGHT (cons 10 10))

(end_curses)
|