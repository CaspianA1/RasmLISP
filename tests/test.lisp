(define (factorial x)
	(if (= x 1) 1
		(* x (factorial (- x 1)))))
(display (factorial 10))