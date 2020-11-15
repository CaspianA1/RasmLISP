(define (plusplus x y) (+ x y))
; (define plusplus (lambda (x y) (+ x y))); diff printouts from these 2

(define nums (cons 1 (cons 2 3)))
(define x (reduce plusplus nums))
(display x)

; not working: reduce, reverse