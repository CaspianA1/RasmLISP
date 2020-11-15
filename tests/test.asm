	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global plusplus  # external symbol for proper linkage
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
	push [nums + rip]  # push global variable
	lea rsi, [plusplus + rip]  # address of procedure plusplus
	push rsi
	call reduce
	add rsp, 16  # discard 2 local arguments
	mov [x + rip], rax
	push [x + rip]  # push global variable
	call display
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
plusplus:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to +
	push [rbp + 16]  # push argument to +
	call plus
	mov rsp, rbp
	pop rbp
	ret

	.data
nums:
	.quad 0
x:
	.quad 0
