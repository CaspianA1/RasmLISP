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

	#  ## # # #

	
/*
r12: current pair
r13, r14: head type, value
r15: tail pointer
Remember to print a space
*/

	
	/*
	mov r12, [rbp + 16]

	mov rsi, [r12]
	cmp rsi, 2
	je head_is_list
	jmp head_is_atom

	head_is_list:
		push [r12 + 8]
		call display_a_list
		add rsp, 8
		jmp handle_tail

	head_is_atom:
		and rsp, -16
		push [r12 + 8]
		call display_num
		add rsp, 8

	handle_tail:
		mov rsi, [r12 + 16]
		cmp rsi, 0x00

		je end_list_display

		push rsi
		call display_a_list
		add rsp, 8

	end_list_display:
		# at this for the inner-list call, it can't find the return address - change rsp?
		# check that no free space is given for parameters passed
		# and do some counting too for which control paths lead to a stack address that isn't divisible by 16
		# https://stackoverflow.com/questions/37511492/x86-assembly-pass-parameter-to-a-function-through-stack
		# ret __num__?
		# https://en.wikibooks.org/wiki/X86_Disassembly/Functions_and_Stack_Frames
		mov rsp, rbp
		pop rbp
		ret
	*/
