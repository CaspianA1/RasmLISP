(define (factorial x) (if (eq? x 0) 1 (* x (factorial (sub1 x)))))
(display_num (factorial 25)) (newline)
