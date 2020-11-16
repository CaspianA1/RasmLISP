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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Segfault:
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
			(drawing_program KEY_RIGHT; changed to track down the bug
				(cons
					(change_y input (car pos))
					(change_x input (car (cdr pos))))))))

(drawing_program (readch) (cons 10 10))

(end_curses); too much malloc
; vertical scroll fast = ok, horizontal = buggy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;