	.global _main
	.text
_main:
	and rsp, -16
	push [symbol_1 + rip]
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
symbol_1:
	.asciz "1"
