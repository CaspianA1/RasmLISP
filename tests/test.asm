	.global _main
	.text
_main:
	push 10  # push argument to factorial
	call factorial
	add rsp, 8  # discard 1 local argument
	push rax  # result of factorial
	call display
	add rsp, 8  # discard 1 local argument
	mov rdi, 0
	mov rax, 0x2000001
	syscall
factorial:
	push rbp
	mov rbp, rsp
	push 1  # push argument to =
	push [rbp + 16]  # push argument to =
	call equal
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, 1
	jmp end_3
	false_2:
	push 1  # push argument to -
	push [rbp + 16]  # push argument to -
	call minus
	add rsp, 16  # discard 2 local arguments
	push rax  # result of -
	call factorial
	add rsp, 8  # discard 1 local argument
	push rax  # result of factorial
	push [rbp + 16]  # push argument to *
	call multiply
	add rsp, 16  # discard 2 local arguments
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret

	.data
