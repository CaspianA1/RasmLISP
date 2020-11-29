(define (factorial x) (if (eq? x 0) 1 (* x (factorial (sub1 x)))))
(display (factorial 10)) (newline)