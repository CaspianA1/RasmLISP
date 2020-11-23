	.global _main
	.text
_main:
	and rsp, -16
	mov rax, r15  # Inline assembly insert
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
