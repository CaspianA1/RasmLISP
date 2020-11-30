; (define (factorial x) (if (eq? x 0) 1 (* x (factorial (sub1 x)))))
; (display (factorial 10)) (newline)
(quote (1 2 3))

(display (eq? (quote 1) (quote 1))); 28
