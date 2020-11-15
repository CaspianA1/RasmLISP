	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global nums  # external symbol for proper linkage
	push 3  # push argument to cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [nums + rip], rax
	.global x  # external symbol for proper linkage
	push 1  # push argument to reduce
	push [nums + rip]  # push global variable
	lea rsi, [multiply + rip]  # address of procedure multiply
	push rsi
	call reduce
	add rsp, 24  # discard 3 local arguments
	mov [x + rip], rax
	push [x + rip]  # push global variable
	call display
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
nums:
	.quad 0
x:
	.quad 0
