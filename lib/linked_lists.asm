	.global _main
	.extern _malloc
	.text

/*
r12 = offset
r13 = argument count
r14 = for saving tail address of previous
r15 = accumulator for result
get offset from argument count?
*/

make_list:
	push rbp
	mov rbp, rsp
	mov r12, 16  # stack offset

	mov rdi, 16  # number of bytes for _malloc
	test r13, 1  # depending on if the arg count is odd or not, a 1-byte stack alignment is needed to avoid a segfault
	jz aligned_malloc
	call _malloc
	jmp init_list_head

	aligned_malloc:
		sub rsp, 8
		call _malloc
		add rsp, 8
		jmp init_list_head

	init_list_head:
		lea r15, [rax]  # store address of primary head in r15
		mov rsi, [rbp + r12]
		mov qword ptr [rax], rsi
		lea r14, [rax + 8]
		add r12, 8  # offset += 8
		sub r13, 1  # argument_count--
	recur_making_list:
		mov rdi, 16  # byte_count = 16
		call _malloc  # malloc(byte_count)
		mov qword ptr [r14], rax  # *prev_node.tail = &current_node.head
		mov rsi, [rbp + r12]  # temporary move for current stack argument
		mov qword ptr [rax], rsi # current_node.head = argument
		add r12, 8  # offset += 8
		sub r13, 1  # argument_count--
		cmp r13, 0  # if argument_count == 0
		je end_making_list  # end()
		lea r14, [rax + 8]  # store &current_node.tail
		jmp recur_making_list  # recur_making_list()
	end_making_list:
		mov qword ptr [rax + 8], '\0'  # current_node.tail = NULL
		mov rax, r15  # rax = primary head (place to return a value from a function)
		mov rsp, rbp
		pop rbp
		ret

car:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]  # rax = first arg
	mov rax, [rax]  # dereference rax's head, and store it in itself
	mov rsp, rbp
	pop rbp
	ret

cdr:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]  # rax = first arg
	mov rax, [rax + 8]  # dereference rax's tail, and store it in itself
	mov rsp, rbp
	pop rbp
	ret

/*
_main:
	mov r13, 4
	push 4
	push 3
	push 2
	push 1
	call make_list
	add rsp, 32  # remove 4 arguments from stack
	mov rdi, 0
	mov rax, 0x2000001
	syscall
*/