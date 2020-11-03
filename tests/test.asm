	.global _main
	.text
_main:
	push 6  # push argument to list_of
	push 1  # type tag for list_of
	push 5  # push argument to list_of
	push 1  # type tag for list_of
	push 4  # push argument to list_of
	push 1  # type tag for list_of
	mov r13, 3  # list of length 3
	call list_of
	add rsp, 48  # discard 3 local arguments
	push rax  # result of list_of
	call display_lat
	add rsp, 8  # discard 1 local argument
	mov rdi, 0
	mov rax, 0x2000001
	syscall
display_lat:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, 0
	jmp end_3
	false_2:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call display_num
	add rsp, 8  # discard 1 local argument
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call display_lat
	add rsp, 8  # discard 1 local argument
	push rax  # result of display_lat
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret

	.data
