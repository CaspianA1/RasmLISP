; reduces correctly
; (define reduce_test (reduce (lambda (x y) (* x y)) nums 1))
; (display reduce_test)

(define (map f lst)
	(if (null? lst) lst
		(cons (f (car lst)) (map f (cdr lst)))))

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

(define (list? x) (not (atom? x)))

(define sequence (cons 1 (cons 2 (cons 3 4)))); other problems
(define tripled (map (lambda (x) (* x 3)) sequence))
; (display_num (car tripled)); why 0?
; (display_list tripled); this works half of the time (except for fhe first element)