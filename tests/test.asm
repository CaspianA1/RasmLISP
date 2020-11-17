	.global _main
	.text
_main:
	mov rdi, rbp
	mov esi, 16
	and rsp, -16
	call _gc_init
	push 2  # push argument to cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call display
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	.global lst1  # external symbol for proper linkage
	push 4  # push argument to cons
	push 3  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [lst1 + rip], rax
	push 5  # push argument to cons
	push 4  # push argument to cons
	push 3  # push argument to cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call display
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	push [lst1 + rip]  # push global variable
	call display
	add rsp, 8  # discard 1 local argument
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
lst1:
	.quad 0
