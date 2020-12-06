	.global _main
	.text
_main:
	and rsp, -16
	.global factorial  # external symbol for proper linkage
	push 25  # push argument to factorial
	call factorial
	add rsp, 8  # discard 1 local argument
	push rax  # result of factorial
	call display_num
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
factorial:
	push rbp
	mov rbp, rsp
	push 0  # push argument to eq?
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, 1
	jmp end_3
	false_2:
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
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
