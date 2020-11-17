	.global _main
	.text
_main:
	call start_curses
	add rsp, 0  # discard 0 local arguments
	.global change_y  # external symbol for proper linkage
	.global change_x  # external symbol for proper linkage
	.global drawing_program  # external symbol for proper linkage
	push 10  # push argument to cons
	push 10  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [KEY_RIGHT + rip]  # push global variable
	call drawing_program
	add rsp, 16  # discard 2 local arguments
	call _endwin
	add rsp, 0  # discard 0 local arguments
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
change_y:
	push rbp
	mov rbp, rsp
	push [KEY_UP + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	push [rbp + 24]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	jmp end_3
	false_2:
	push [KEY_DOWN + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_4  # true branch
	jmp false_5  # false branch
	true_4:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	jmp end_6
	false_5:
	mov rax, [rbp + 24]
	jmp end_6
	end_6:
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret
change_x:
	push rbp
	mov rbp, rsp
	push [KEY_LEFT + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_7  # true branch
	jmp false_8  # false branch
	true_7:
	push [rbp + 24]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	jmp end_9
	false_8:
	push [KEY_RIGHT + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_10  # true branch
	jmp false_11  # false branch
	true_10:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	jmp end_12
	false_11:
	mov rax, [rbp + 24]
	jmp end_12
	end_12:
	jmp end_9
	end_9:
	mov rsp, rbp
	pop rbp
	ret
drawing_program:
	push rbp
	mov rbp, rsp
	push 'q'  # push argument to eq?
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_13  # true branch
	jmp false_14  # false branch
	true_13:
	mov rax, 0
	jmp end_15
	false_14:
	push '*'  # push argument to printscr
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call printscr
	add rsp, 24  # discard 3 local arguments
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to change_x
	call change_x
	add rsp, 16  # discard 2 local arguments
	push rax  # result of change_x
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to change_y
	call change_y
	add rsp, 16  # discard 2 local arguments
	push rax  # result of change_y
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call readch
	add rsp, 0  # discard 0 local arguments
	push rax  # result of readch
	call drawing_program
	add rsp, 16  # discard 2 local arguments
	push rax  # result of drawing_program
	jmp end_15
	end_15:
	mov rsp, rbp
	pop rbp
	ret

	.data
