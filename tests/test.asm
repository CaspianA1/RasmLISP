	.global _main
	.text
_main:
	push 2  # push argument to list_of
	push 1  # type tag for list_of
	push 1  # push argument to list_of
	push 1  # type tag for list_of
	mov r13, 2  # list of length 2
	call list_of
	add rsp, 32  # discard 2 local arguments
	mov [nums + rip], rax
	mov rsi, [nums + rip]
	push rsi  # push variable
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call null?
	add rsp, 8  # discard 1 local argument
	mov [result + rip], rax
	mov rsi, [result + rip]
	push rsi  # push variable
	call display_num
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	mov rdi, 0
	mov rax, 0x2000001
	syscall
list?:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to atom?
	call atom?
	add rsp, 8  # discard 1 local argument
	push rax  # result of atom?
	call bool_not
	mov rsp, rbp
	pop rbp
	ret

	.data
nums:
	.quad 0
result:
	.quad 0
