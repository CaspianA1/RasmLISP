|
(define terrain (list #\_ #\_ #\_ #\. #\, #\hline #\/))
(define (_progress_terrain terrain shifted)
	(if (null? terrain) shifted
		(cons (car terrain) (_progress_terrain (cdr terrain) shifted))))
(define (progress_terrain lst) (_progress_terrain (cdr lst) (car lst)))
(display (progress_terrain (list 1 2 3 4 5)))
|

(define MAX_Y (getmaxy))

; (define (display_terrain across)
		; (begin
			; (printscr (sub1 MAX_Y) across #\a))
			; (display_terrain (cdr terrain) (add1 across)))))

(start_curses)

; can't do anything related to maxy here
(printscr (- MAX_Y 2) 1 #\a)
(readch)
(end_curses)
; a scrolling desert will be my second demo