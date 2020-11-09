	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	push ' '  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push 'h'  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
