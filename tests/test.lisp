|
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

; Problem 1:
(define sequence (cons 1 (cons 2 (cons 3 4))))
(display_list (map (lambda (x) (* x 3)) (cons 7 (cons 8 (cons 9 10)))))
(newline)
; Sequence is not remotely involved! Why is it mutated?
(display_list sequence)
|

|
Before, I used allocate and malloc inconsistently, which was a problem

Just _malloc:
Input list:
(1 2 3 4)
Output list:
(3 6 9 12 48)
Input list mutated to:
(1 2 3 4)

Just _allocate:
Input list:
(1 2 3 4)
Output list:
(27 6 9 12 48)
Input list mutated to:
(9 12 48)

1. Find out why the output list's first element is 27
2. Find out why the input list is mutated
|