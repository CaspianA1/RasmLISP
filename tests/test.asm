	.global _main
	.text
_main:
	push 10  # push argument to list
	push 10  # push argument to list
	mov r13, 2  # list of length 2
	call list
	add rsp, 16  # discard 2 local arguments
	push rax  # result of list
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
