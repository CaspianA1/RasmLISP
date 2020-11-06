	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	push 2  # push argument to higher_order
	jmp after_lambda_1
	lambda_1:
	push rbp
	mov rbp, rsp
	push 1  # push argument to +
	push [rbp + 16]  # push argument to +
	call plus
	add rsp, 16  # discard 2 local arguments
	push rax  # result of +
	mov rbp, rsp
	pop rbp
	ret
	after_lambda_1:
	lea rax, [lambda_1 + rip]
	push rax
	call higher_order
	add rsp, 16  # discard 2 local arguments
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
higher_order:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to [rbp + 16]
	call bool_not
	mov rsp, rbp
	pop rbp
	ret

	.data
