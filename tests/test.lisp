(define MAX_Y 5)
(define MAX_X 5)
(define ALIVE #\*)
(define DEAD #\space)

|
3 things:
1. Why does a list height of over 4 result in a crash?
3. Why do generated screens not seem to follow Conway's rules? (I might be wrong on this.)
3. Once those bugs are resolved try making bigger grids.
|

(define grid
	(list
		(list ALIVE DEAD ALIVE DEAD ALIVE)
		(list ALIVE ALIVE DEAD ALIVE DEAD)
		(list ALIVE ALIVE DEAD ALIVE DEAD)
		(list ALIVE DEAD DEAD DEAD ALIVE)
		(list ALIVE ALIVE ALIVE ALIVE DEAD)))

;;;;;;;;;;
(define (make_empty_row width buffer init)
	(if (eq? width 0) buffer
		(make_empty_row (sub1 width) (cons init buffer) init)))

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
;;;;;;;;;;
(define (get_neighboring_coords y x)
	(list
		(cons (sub1 y) (sub1 x))
		(cons (sub1 y) x)
		(cons (sub1 y) (add1 x))
		(cons y (sub1 x))
		(cons y (add1 x))
		(cons (add1 y) (sub1 x))
		(cons (add1 y) x)
		(cons (add1 y) (add1 x))))

(define (valid_coord? y x)
		(not (or
			(or (< y 0) (> y MAX_Y))
			(or (< x 0) (> x MAX_X)))))

(define (get_neighbors y x)
	(filter
		(lambda (p)
			(eq? (index (index grid (car p)) (car (cdr p))) ALIVE))
		(filter
			(lambda (p) (valid_coord? (car p) (car (cdr p))))
			(get_neighboring_coords y x))))

;;;;;;;;;;
(define (update_cell cell num_neighbors)
	(if (eq? cell ALIVE)
		(if (or (< num_neighbors 2) (> num_neighbors 3)) DEAD ALIVE)
		(if (eq? num_neighbors 3) ALIVE DEAD)))


(define (update_grid grid y x)
	(cond
		((null? grid) grid)
		((null? (car grid)) (update_grid (cdr grid) (add1 y) 0))
		(else
			(cons
				(cons
					(update_cell (car (car grid)) (length (get_neighbors y x)))
					(cdr (car grid)))
				(update_grid (cdr grid) y (add1 x))))))

|
(start_curses)
(define (main changing_grid)
	(begin
		(display_grid changing_grid 0)
		(refresh)
		(nap 500)
		(main (update_grid changing_grid 0 0))))

(main grid)
(end_curses)
|

(define grid2 (update_grid grid 0 0)); updating the grid for height > 4 = segfault

| A stack trace:

|

; (define empty_grid (make_empty_row MAX_Y nil (make_empty_row MAX_X nil #\.)))