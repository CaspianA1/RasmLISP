	.global _main
	.text
_main:
	and rsp, -16
	.global A  # external symbol for proper linkage
	push '*'  # push argument to id
	call id
	add rsp, 8  # discard 1 local argument
	mov [A + rip], rax
	.global D  # external symbol for proper linkage
	push ' '  # push argument to id
	call id
	add rsp, 8  # discard 1 local argument
	mov [D + rip], rax
	call start_curses
	add rsp, 0  # discard 0 local arguments
	.global MAX_Y  # external symbol for proper linkage
	call getmaxy
	add rsp, 0  # discard 0 local arguments
	mov [MAX_Y + rip], rax
	.global MAX_X  # external symbol for proper linkage
	call getmaxx
	add rsp, 0  # discard 0 local arguments
	mov [MAX_X + rip], rax
	.global list_of_dead  # external symbol for proper linkage
	.global random_row  # external symbol for proper linkage
	.global random_board  # external symbol for proper linkage
	.global board  # external symbol for proper linkage
	push 0  # push argument to random_board
	push [nil + rip]  # push global variable
	call random_board
	add rsp, 16  # discard 2 local arguments
	mov [board + rip], rax
	.global display_row  # external symbol for proper linkage
	.global display_grid  # external symbol for proper linkage
	.global get_neighbors  # external symbol for proper linkage
	.global update_cell  # external symbol for proper linkage
	.global update_row  # external symbol for proper linkage
	.global update_grid  # external symbol for proper linkage
	.global conway  # external symbol for proper linkage
	push [board + rip]  # push global variable
	call conway
	add rsp, 8  # discard 1 local argument
	call end_curses
	add rsp, 0  # discard 0 local arguments
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
list_of_dead:
	push rbp
	mov rbp, rsp
	push 0  # push argument to eq?
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, [rbp + 24]
	jmp end_3
	false_2:
	push [rbp + 24]  # push argument to cons
	push [D + rip]  # push global variable
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	call list_of_dead
	add rsp, 16  # discard 2 local arguments
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret
random_row:
	push rbp
	mov rbp, rsp
	push [MAX_X + rip]  # push global variable
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_4  # true branch
	jmp false_5  # false branch
	true_4:
	mov rax, [rbp + 16]
	jmp end_6
	false_5:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cons
	push [A + rip]  # push global variable
	push 9  # push argument to list_of_dead
	call list_of_dead
	add rsp, 16  # discard 2 local arguments
	push rax  # result of list_of_dead
	call choice
	add rsp, 8  # discard 1 local argument
	push rax  # result of choice
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call random_row
	add rsp, 16  # discard 2 local arguments
	jmp end_6
	end_6:
	mov rsp, rbp
	pop rbp
	ret
random_board:
	push rbp
	mov rbp, rsp
	push [MAX_Y + rip]  # push global variable
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_7  # true branch
	jmp false_8  # false branch
	true_7:
	mov rax, [rbp + 16]
	jmp end_9
	false_8:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cons
	push 0  # push argument to random_row
	push [nil + rip]  # push global variable
	call random_row
	add rsp, 16  # discard 2 local arguments
	push rax  # result of random_row
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call random_board
	add rsp, 16  # discard 2 local arguments
	jmp end_9
	end_9:
	mov rsp, rbp
	pop rbp
	ret
display_row:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_10  # true branch
	jmp false_11  # false branch
	true_10:
	mov rax, 0
	jmp end_12
	false_11:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 32]  # push argument to printscr
	push [rbp + 24]  # push argument to printscr
	call printscr
	add rsp, 24  # discard 3 local arguments
	push [rbp + 32]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 24]  # push argument to display_row
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call display_row
	add rsp, 24  # discard 3 local arguments
	push rax  # result of display_row
	jmp end_12
	end_12:
	mov rsp, rbp
	pop rbp
	ret
display_grid:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_13  # true branch
	jmp false_14  # false branch
	true_13:
	mov rax, 0
	jmp end_15
	false_14:
	push 0  # push argument to display_row
	push [rbp + 24]  # push argument to display_row
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call display_row
	add rsp, 24  # discard 3 local arguments
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call display_grid
	add rsp, 16  # discard 2 local arguments
	push rax  # result of display_grid
	jmp end_15
	end_15:
	mov rsp, rbp
	pop rbp
	ret
get_neighbors:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to cons
	push [rbp + 16]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	push [rbp + 16]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	push [rbp + 16]  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to cons
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 24]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	mov r13, 8  # list of length 8
	call list
	add rsp, 64  # discard 8 local arguments
	push rax  # result of list
	jmp after_anonymous_1
	anonymous_1:
	push rbp
	mov rbp, rsp
	jmp after_anonymous_2
	anonymous_2:
	push rbp
	mov rbp, rsp
	push [MAX_X + rip]  # push global variable
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	push rax  # result of eq?
	push 0  # push argument to <
	push [rbp + 24]  # push argument to <
	call smaller
	add rsp, 16  # discard 2 local arguments
	push rax  # result of <
	call bool_or
	add rsp, 16  # discard 2 local arguments
	push rax  # result of or
	push [MAX_Y + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	push rax  # result of eq?
	push 0  # push argument to <
	push [rbp + 16]  # push argument to <
	call smaller
	add rsp, 16  # discard 2 local arguments
	push rax  # result of <
	call bool_or
	add rsp, 16  # discard 2 local arguments
	push rax  # result of or
	call bool_or
	add rsp, 16  # discard 2 local arguments
	push rax  # result of or
	call bool_not
	add rsp, 8  # discard 1 local argument
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_2:
	lea rbx, [anonymous_2 + rip]
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call rbx
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_1:
	lea rbx, [anonymous_1 + rip]
	push rbx  # push lambda #2
	call filter
	add rsp, 16  # discard 2 local arguments
	push rax  # result of filter
	jmp after_anonymous_3
	anonymous_3:
	push rbp
	mov rbp, rsp
	jmp after_anonymous_4
	anonymous_4:
	push rbp
	mov rbp, rsp
	push [A + rip]  # push global variable
	push [rbp + 24]  # push argument to index
	push [rbp + 16]  # push argument to index
	push [board + rip]  # push global variable
	call index
	add rsp, 16  # discard 2 local arguments
	push rax  # result of index
	call index
	add rsp, 16  # discard 2 local arguments
	push rax  # result of index
	call eq?
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_4:
	lea rbx, [anonymous_4 + rip]
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call rbx
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_3:
	lea rbx, [anonymous_3 + rip]
	push rbx  # push lambda #4
	call filter
	mov rsp, rbp
	pop rbp
	ret
update_cell:
	push rbp
	mov rbp, rsp
	push [A + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_16  # true branch
	jmp false_17  # false branch
	true_16:
	push 2  # push argument to <
	push [rbp + 24]  # push argument to <
	call smaller
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_19  # true branch
	jmp false_20  # false branch
	true_19:
	mov rax, [D + rip]
	jmp end_21
	false_20:
	push 3  # push argument to eq?
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	push rax  # result of eq?
	push 2  # push argument to eq?
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	push rax  # result of eq?
	call bool_or
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_22  # true branch
	jmp false_23  # false branch
	true_22:
	mov rax, [A + rip]
	jmp end_24
	false_23:
	mov rax, [D + rip]
	jmp end_24
	end_24:
	jmp end_21
	end_21:
	jmp end_18
	false_17:
	push 3  # push argument to eq?
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_25  # true branch
	jmp false_26  # false branch
	true_25:
	mov rax, [A + rip]
	jmp end_27
	false_26:
	mov rax, [D + rip]
	jmp end_27
	end_27:
	jmp end_18
	end_18:
	mov rsp, rbp
	pop rbp
	ret
update_row:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_28  # true branch
	jmp false_29  # false branch
	true_28:
	mov rax, [rbp + 16]
	jmp end_30
	false_29:
	push [rbp + 32]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 24]  # push argument to update_row
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call update_row
	add rsp, 24  # discard 3 local arguments
	push rax  # result of update_row
	push [rbp + 32]  # push argument to get_neighbors
	push [rbp + 24]  # push argument to get_neighbors
	call get_neighbors
	add rsp, 16  # discard 2 local arguments
	push rax  # result of get_neighbors
	call length
	add rsp, 8  # discard 1 local argument
	push rax  # result of length
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call update_cell
	add rsp, 16  # discard 2 local arguments
	push rax  # result of update_cell
	call cons
	add rsp, 16  # discard 2 local arguments
	jmp end_30
	end_30:
	mov rsp, rbp
	pop rbp
	ret
update_grid:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_31  # true branch
	jmp false_32  # false branch
	true_31:
	mov rax, [rbp + 16]
	jmp end_33
	false_32:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call update_grid
	add rsp, 16  # discard 2 local arguments
	push rax  # result of update_grid
	push 0  # push argument to update_row
	push [rbp + 24]  # push argument to update_row
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call update_row
	add rsp, 24  # discard 3 local arguments
	push rax  # result of update_row
	call cons
	add rsp, 16  # discard 2 local arguments
	jmp end_33
	end_33:
	mov rsp, rbp
	pop rbp
	ret
conway:
	push rbp
	mov rbp, rsp
	push 0  # push argument to display_grid
	push [rbp + 16]  # push argument to display_grid
	call display_grid
	add rsp, 16  # discard 2 local arguments
	call refresh
	add rsp, 0  # discard 0 local arguments
	push 200  # push argument to nap
	call nap
	add rsp, 8  # discard 1 local argument
	push [rbp + 16]  # push argument to id
	call id
	add rsp, 8  # discard 1 local argument
	mov [board + rip], rax
	push 0  # push argument to update_grid
	push [rbp + 16]  # push argument to update_grid
	call update_grid
	add rsp, 16  # discard 2 local arguments
	push rax  # result of update_grid
	call conway
	add rsp, 8  # discard 1 local argument
	push rax  # result of conway
	mov rsp, rbp
	pop rbp
	ret

	.data
A:
	.quad '*'
D:
	.quad ' '
MAX_Y:
	.quad 0
MAX_X:
	.quad 0
board:
	.quad 0
