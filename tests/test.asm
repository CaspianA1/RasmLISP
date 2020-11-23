	.global _main
	.text
_main:
	and rsp, -16
	.global testing  # external symbol for proper linkage
	push 3  # push argument to testing
	push 2  # push argument to testing
	call [testing + rip]
	add rsp, 16  # discard 2 local arguments
	push rax  # result of testing
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
testing:
	.quad plus
