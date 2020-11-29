	.global _main
	.text
_main:
	and rsp, -16
	push [symbol_1 + rip]
	push [symbol_2 + rip]
	mov r13, 2  # list of length 2
	call list
	add rsp, 16  # discard 2 local arguments
	push [symbol_3 + rip]
	mov r13, 2  # list of length 2
	call list
	add rsp, 16  # discard 2 local arguments
	push [symbol_4 + rip]
	mov r13, 2  # list of length 2
	call list
	add rsp, 16  # discard 2 local arguments
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
symbol_1:
	.quad "3"
symbol_2:
	.quad "2"
symbol_3:
	.quad "quote"
symbol_4:
	.quad "1"
