	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global f  # external symbol for proper linkage
	push 2  # push argument to f
	call f
	add rsp, 8  # discard 1 local argument
	push rax  # result of f
	call display
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
f:
	push rbp
	mov rbp, rsp
	jmp after_anonymous_1
	anonymous_1:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to *
	push [rbp + 16]  # push argument to *
	call multiply
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_1:
	lea rax, [anonymous_1 + rip]
	push 3  # push argument to rax
	call rax
	add rsp, 8  # discard 1 local argument
	mov rsp, rbp
	pop rbp
	ret

	.data
