;;;;;;;;;;;;;;;;;;;;
(define A #\*)
(define D #\space)
(start_curses)
(define MAX_Y (getmaxy))
(define MAX_X (getmaxx))

;;;;;;;;;;;;;;;;;;;;
(define (list_of_dead num_dead buffer)
	(if (eq? num_dead 0) buffer
		(list_of_dead
			(sub1 num_dead)
			(cons D buffer))))

(define (random_row buffer x)
	(if (eq? x MAX_X) buffer
		(random_row
			(cons (choice (list_of_dead 9 A)) buffer)
			(add1 x))))

(define (random_board buffer y)
	(if (eq? y MAX_Y) buffer
		(random_board
			(cons (random_row nil 0) buffer)
			(add1 y))))

(define board (random_board nil 0))
;;;;;;;;;;;;;;;;;;;;
(define (display_row row y x)
	(if (null? row) 0
		(begin
			(printscr y x (car row))
			(display_row (cdr row) y (add1 x)))))

(define (display_grid grid y)
	(if (null? grid) 0
		(begin
			(display_row (car grid) y 0)
			(display_grid (cdr grid) (add1 y)))))
;;;;;;;;;;;;;;;;;;;;
(define (get_neighbors y x)
	(filter
		(lambda (coord)
			((lambda (y x) (eq? (index (index board y) x) A))
			(car coord) (car (cdr coord))))
		(filter
			(lambda (coord)
				((lambda (y x)
					(not (or
						(or (< y 0) (eq? y MAX_Y))
						(or (< x 0) (eq? x MAX_X)))))
					(car coord) (car (cdr coord))))
			(list
				(cons (sub1 y) (sub1 x))
				(cons (sub1 y) x)
				(cons (sub1 y) (add1 x))
				(cons y (sub1 x))
				(cons y (add1 x))
				(cons (add1 y) (sub1 x))
				(cons (add1 y) x)
				(cons (add1 y) (add1 x))))))

(define (update_cell cell num_neighbors)
	(if (eq? cell A)
		(cond
			((< num_neighbors 2) D)
			((or (eq? num_neighbors 2) (eq? num_neighbors 3)) A)
			(else D))
		(if (eq? num_neighbors 3) A D)))

(define (update_row row y x)
	(if (null? row) row
		(cons
			(update_cell (car row) (length (get_neighbors y x)))
			(update_row (cdr row) y (add1 x)))))

(define (update_grid grid y)
	(if (null? grid) grid
		(cons
			(update_row (car grid) y 0)
			(update_grid (cdr grid) (add1 y)))))
;;;;;;;;;;;;;;;;;;;;
(define (conway grid)
	(begin
		(display_grid grid 0)
		(refresh)
		(nap 50)
		(set! board grid)
		(conway (update_grid grid 0))))

(conway board)
(end_curses)
;;;;;;;;;;;;;;;;;;;;