	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	push 4  # push argument to cons
	push 3  # push argument to cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 3  # push argument to cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call append
	add rsp, 16  # discard 2 local arguments
	push rax  # result of append
	call display
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
