(define (mul2 x y) (* x y))
(define nums (cons 1 (cons 2 (cons 3 (cons 4 5)))))
(define result (reduce mul2 nums))
(display result)