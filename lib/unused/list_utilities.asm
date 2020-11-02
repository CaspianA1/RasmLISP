	.global _main, display_list
	.text

display_list:
	push rbp
	mov rbp, rsp

	sub rsp, 8
	push '('
	call display_char
	add rsp, 16

	mov r12, [rbp + 16]
	recur_display_list:
		# 1st time: rsi = 2, rdi = _ pointer to heap memory for list
		mov rsi, [r12]  # type tag
		mov rdi, [r12 + 8]  # value
		# see that these two are correct

		push rdi
		cmp rsi, 2  # trace this control flow
		je print_nested_list
		call display_num
		jmp after_printing_elem
		print_nested_list:
			call display_list
		after_printing_elem:  # this should go more than once
			add rsp, 8
			mov rax, [r12 + 16]  # pointer to next
			cmp rax, 0x00
			je end_display_list

		mov r12, rax

		# sub rsp, 8
		push ' '
		and rsp, -16
		call display_char
		# add rsp, 16
		add rsp, 8

		jmp recur_display_list

	end_display_list:
		push ')'
		call display_char
		add rsp, 8
		mov rax, 0
		mov rsp, rbp
		pop rbp
		ret