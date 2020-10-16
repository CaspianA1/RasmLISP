.global _main
.text

/*
A procedure in Lisp:
(define (triple_add x y z) (+ x (+ y z)))
*/

_main:
	mov rdi, 0
	mov rax, 0x2000001
	syscall