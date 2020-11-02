	.global _main
	.text
_main:
	push 3  # push argument to <=
	push 4  # push argument to <=
	call smaller_eq
	add rsp, 16  # discard 2 local arguments
	push rax  # result of <=
	call display_num
	add rsp, 8  # discard 1 local argument
	mov rdi, 0
	mov rax, 0x2000001
	syscall

	.data
