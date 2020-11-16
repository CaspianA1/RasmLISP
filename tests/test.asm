	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	call start_curses
	add rsp, 0  # discard 0 local arguments
	push 3  # push argument to init_color
	push 2  # push argument to init_color
	push 1  # push argument to init_color
	call init_color
	add rsp, 24  # discard 3 local arguments
	push 5  # push argument to init_color
	push 5  # push argument to init_color
	push 2  # push argument to init_color
	call init_color
	add rsp, 24  # discard 3 local arguments
	push 2  # push argument to activate_color
	call activate_color
	add rsp, 8  # discard 1 local argument
	.global response  # external symbol for proper linkage
	call _getch
	add rsp, 0  # discard 0 local arguments
	mov [response + rip], rax
	push [response + rip]  # push global variable
	push 3  # push argument to print_char
	push 2  # push argument to print_char
	call print_char
	add rsp, 24  # discard 3 local arguments
	call _refresh
	add rsp, 0  # discard 0 local arguments
	push 2  # push argument to deactivate_color
	call deactivate_color
	add rsp, 8  # discard 1 local argument
	call _getch
	add rsp, 0  # discard 0 local arguments
	call _endwin
	add rsp, 0  # discard 0 local arguments
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
response:
	.quad 0
