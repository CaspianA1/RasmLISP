| Works
(define first (cons 1 2))
(define second (cons (cons 2 3) 4))
(display (append first second))
|

| Works
(define first (cons 1 2))
(display (append first (cons (cons 2 3) 4)))
|

(display (append (cons 1 (cons 2 3)) (cons (cons 2 3) 4)))