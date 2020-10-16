(define (factorial x)
	(if (= x 1) 1
		(* x (factorial (- x 1)))))

(define result (factorial 12))

(display result)