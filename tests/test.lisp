(define (f a)
	(let ((b 3) (c 4))
		(* a (* b c))))
(display (f 2)); wrong result! is 36, should be 