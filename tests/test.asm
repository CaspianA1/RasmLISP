	.global _main
	.text
_main:
	push 2
	call display_num
	add rsp, 8  # discard 1 local argument
	mov rdi, 0
	mov rax, 0x2000001
	syscall

	.data
