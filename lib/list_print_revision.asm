	.global _main, display_a_list
	.text

display_a_list:
	push rbp
	mov rbp, rsp
	mov r12, [rbp + 16]
	mov r13, 1
	recur_print:
		mov rsi, [r12]
		cmp rsi, 1
		je print_atom
		jmp print_list
		print_atom:
			mov rsi, [r12 + 8]
			lea rdi, format_number [rip]
			xor rax, rax
			# and rsp, -16		
			call _printf
			mov rdi, 0
			call _fflush
			jmp handle_tail
		print_list:
			inc r13
			mov r14, [r12 + 16]  # save cadr of list
			mov r12, [r12 + 8]
			# save the element after this list, and when recurring is finished (and r13 isn't zero),
			# iterate upon that
			jmp recur_print
		handle_tail:
			mov rsi, [r12 + 16]
			cmp rsi, 0x00
			je check_for_list_end
			jmp print_tail
			check_for_list_end:
				pop r12
				mov r12, r14  # volatile
				dec r13
				cmp r13, 0
				je end_display_a_list

				mov r12, r14
				jmp recur_print

			print_tail:
				mov r12, rsi
				jmp recur_print

	end_display_a_list:
		mov rsp, rbp
		pop rbp
		ret

/*
Program:
(define test_list (list_of (list_of 1 2) 3))
(display_a_list test_list)

Its flow:
display_a_list
recur_print
print_list (first element = list, so that makes sense)
recur_print
print_atom (first inner list element is an atom, makes sense)
handle_tail
print_tail
recur_print
print_atom (second inner list element is an atom too)
handle_tail
check_for_list_end (where is this reached, exactly?)
print_tail
recur_print
recur_print

Watch the value of r13
*/

# if I can make list?, then I can print a list with a Lisp function