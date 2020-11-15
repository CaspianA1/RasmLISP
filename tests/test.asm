	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global lst  # external symbol for proper linkage
	push 4  # push argument to cons
	push 3  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 2  # push argument to cons
	push 15  # push argument to cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [lst + rip], rax
	push [lst + rip]  # push global variable
	call display
	add rsp, 8  # discard 1 local argument
	push [lst + rip]  # push global variable
	call flatten
	add rsp, 8  # discard 1 local argument
	push rax  # result of flatten
	call display
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
lst:
	.quad 0
