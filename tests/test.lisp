(define nums (cons 1 (cons 2 3)))
(define x (reduce * nums 1))
(display x)