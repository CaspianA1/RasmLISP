	.global _main
	.text
_main:
	call rand32
	add rsp, 0  # discard 0 local arguments
	push rax  # result of rand32
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
