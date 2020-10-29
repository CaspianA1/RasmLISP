make_pair:
	push rbp
	mov rbp, rsp
	# boilerplate!
	mov rdi, 32
	sub rsp, 8
	call _malloc
	add rsp, 8
	mov rsi, [rbp + 16]
	mov [rax], rsi
	mov rsi, [rbp + 24]
	mov [rax + 8], rsi
	mov rsi, [rbp + 32]
	mov [rax + 16], rsi
	mov rsi, [rbp + 40]
	mov [rax + 24], rsi
	mov rsp, rbp
	pop rbp
	ret

	/*
	mov rdi, 16
	sub rsp, 8
	call _malloc
	add rsp, 8
	mov [rax], [rbp + r12]

	lea r14, [rax + 8]  # save tail ptr
	mov r15, rax  # save head ptr
	*/

	
	/*
	mov rdi, 16
	call _malloc

	move_argument_into_memory 0
	move_argument_into_memory 8
	sub r13, 1

	mov rbx, rax  # save the head
	
	mov rdi, 16
	call _malloc
	mov [rax], rbx  # &head in block

	cmp r13, 0
	je end_make_list

	mov qword ptr [r14], rax  # *prev_tail = curr_block
	lea r14, [rax + 8]  # save &tail
	jmp recur_make_list
	*/