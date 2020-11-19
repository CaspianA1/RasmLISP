|
(start_curses)
(define MAX_Y (getmaxy))
(define MAX_X (getmaxx))
(end_curses)
|

(define MAX_Y 5)
(define MAX_X 10)

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
		(not (or (or (< y 0) (> y MAX_Y))
			(or (< x 0) (> x MAX_X)))))

(define (get_cell grid y x) (index (index grid y) x))

| Segfaulting:
(define (neighbor_count grid y x)
	(length 
		(filter
			(lambda (coord) (eq? (get_cell grid y x) #\,))
				(filter
					(lambda (pair) (valid_coord? (car pair) (car (cdr pair))))
					(get_neighboring_coords y x)))))
|


(define (neighbor_count grid y x)
	(length
		(filter
			(lambda (pair) (valid_coord? (car pair) (car (cdr pair))))
		(get_neighboring_coords y x))))

;;;;;;;;;;

(define (update_cell cell num_neighbors)
	(if (eq? cell #\,)
		(if (or (< num_neighbors 2) (> num_neighbors 3)) #\. #\,)
		(if (eq? num_neighbors 3) #\, #\.)))

(define (update_grid grid y x)
	(cond 
		((null? grid) grid)
		((null? (car grid)) (update_grid (cdr grid) (add1 y) 0))
		(else
			(cons
				(update_cell
					(car (car grid))
					(neighbor_count grid y x))
				(update_grid
					(cons
						(cdr (car grid))
						(cdr grid))
						y (add1 x))
			)
		)
	)
)

(define empty_grid (make_empty_row MAX_Y nil (make_empty_row MAX_X nil #\.)))
(define updated (update_grid empty_grid 0 0))
; examine the updated grid
; it is wrong
; check what is going wrong through a slow hand-trace
; test each function individually to see that it's working as expected

(display updated)

; (display_grid updated 0); damn, segfault
; (readch)
; (end_curses)

; (define empty_grid (make_empty_row MAX_Y nil (make_empty_row MAX_X nil #\-)))
; instead of random number generation, let the user make one
; alive = comma, dead = dot
