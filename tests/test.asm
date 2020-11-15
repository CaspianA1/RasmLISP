	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global x  # external symbol for proper linkage
	push 6  # push argument to cons
	push 5  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [x + rip], rax
	push [x + rip]  # push global variable
	call display_list
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
x:
	.quad 0
