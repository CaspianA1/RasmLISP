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
	push 5  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [nums + rip], rax
	push [nums + rip]  # push global variable
	jmp after_anonymous_1
	anonymous_1:
	push rbp
	mov rbp, rsp
	push 2  # push argument to >
	push [rbp + 16]  # push argument to >
	call greater
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_1:
	lea rax, [anonymous_1 + rip]
	push rax
	call filter
	add rsp, 16  # discard 2 local arguments
	push rax  # result of filter
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
