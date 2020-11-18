	.global _main
	.text
_main:
	.global MAX_Y  # external symbol for proper linkage
	call getmaxy
	add rsp, 0  # discard 0 local arguments
	mov [MAX_Y + rip], rax
	call start_curses
	add rsp, 0  # discard 0 local arguments
	push 'a'  # push argument to printscr
	push 1  # push argument to printscr
	push 2  # push argument to -
	push [MAX_Y + rip]  # push global variable
	call minus
	add rsp, 16  # discard 2 local arguments
	push rax  # result of -
	call printscr
	add rsp, 24  # discard 3 local arguments
	call readch
	add rsp, 0  # discard 0 local arguments
	call end_curses
	add rsp, 0  # discard 0 local arguments
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
MAX_Y:
	.quad 0
