	.global _main
	.text
_main:
	and rsp, -16
	push [symbol_1 + rip]
	push [symbol_2 + rip]
	push [symbol_3 + rip]
	mov r13, 3  # list of length 3
	call list
	add rsp, 24  # discard 3 local arguments
	push [symbol_3 + rip]
	push [symbol_3 + rip]
	call eq?
	add rsp, 16  # discard 2 local arguments
	push rax  # result of eq?
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
symbol_1:
	.asciz "3"
symbol_2:
	.asciz "2"
symbol_3:
	.asciz "1"
