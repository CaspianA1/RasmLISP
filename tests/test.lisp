(define (higher_order f a) (f a))
(higher_order (lambda (x) (+ x 1)) 2)