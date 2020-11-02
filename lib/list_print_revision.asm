	.global _main, display_a_list
	.text

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
		# and rsp, -16
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

		/*
		warning: unhandled dyld version (16)
		12
		Thread 2 hit Breakpoint 1, 0x0000000100003db9 in end_print ()
		(gdb) disassemble
		Dump of assembler code for function end_print:
		=> 0x0000000100003db9 <+0>:	mov    rsp,rbp
		   0x0000000100003dbc <+3>:	pop    rbp
		   0x0000000100003dbd <+4>:	ret    
		End of assembler dump.
		(gdb) c
		Continuing.

		Thread 2 hit Breakpoint 1, 0x0000000100003db9 in end_print ()
		(gdb) ni
		0x0000000100003dbc in end_print ()
		(gdb) c
		Continuing.

		Thread 2 hit Breakpoint 1, 0x0000000100003db9 in end_print ()
		(gdb) c
		Continuing.

		*/