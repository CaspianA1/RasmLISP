(define (g a) (let ((b 3)) (* a b)))
(display (g 2))
(newline)

(define (f a) ((lambda (b) (* a b)) 3))
(display (f 2))