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

	###############


# print it iteratively?
display_a_list:
	push rbp
	mov rbp, rsp
	mov r12, [rbp + 16]

	mov rdi, [r12]
	cmp rdi, 1
	je print_atom  # tag 1 = print atom, otherwise print list
	jmp print_list

	print_atom:
		mov rsi, [r12 + 8]
		lea rdi, format_number [rip]
		xor rax, rax
		and rsp, -16
		call _printf  # align the stack here!
		mov rdi, 0
		call _fflush
		jmp after_print_head

	print_list:
		push [r12 + 8]
		call display_a_list
		add rsp, 8

	after_print_head:
		mov rsi, [r12 + 16]  # mov or lea?
		cmp rsi, 0x00
		je end_print

		push rsi
		call display_a_list
		add rsp, 8

	end_print:
		mov rsp, rbp
		pop rbp  # https://stackoverflow.com/questions/36568642/using-call-ret-in-assembly-x86
		ret  # the wrong return address is being returned to
		# see how many times end_print is gone to
		# the number of times is surprisingly perfect! Interesting.
		# but values aren't always printed out
		# see that print_atom is being gone to enough times (I expect 3).
		# Then we will see what is going wrong.
		# print_atom is only being reached twice.
		# make an exit counter.	

	########


print_car:
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]

	mov rdi, [rsi]
	cmp rdi, 2
	je list_print
	jmp atom_print
	list_print:
		inc r13
		push [rsi + 8]
		call display_a_list
		add rsp, 8	
		jmp end_print_elem
	atom_print:
		mov rsi, [rsi + 8]
		lea rdi, format_number [rip]
		xor rax, rax
		and rsp, -16		
		call _printf  # align the stack here!
		mov rdi, 0
		call _fflush
	end_print_elem:
		mov rsp, rbp
		pop rbp
		ret

display_a_list:
	push rbp
	mov rbp, rsp
	mov r12, [rbp + 16]

	push r12
	call print_car
	add rsp, 8

	mov rsi, [r12 + 16]
	cmp rsi, 0x00
	je check_for_end
	jmp pr_tail

	check_for_end:
		dec r13
		cmp r13, 0
		je disp_end

	pr_tail:
		push rsi
		call display_a_list
		add rsp, 8

	disp_end:
		mov rsp, rbp
		pop rbp
		ret

	####
