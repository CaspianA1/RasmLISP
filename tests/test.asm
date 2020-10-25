	.global _main
	.text
_main:
	push 5  # push argument to +
	push 4  # push argument to +
	call plus
	add rsp, 16  # discard 2 local arguments
	push rax  # result of +
	call display
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	mov rdi, 0
	mov rax, 0x2000001
	syscall

	.data
