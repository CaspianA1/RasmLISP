	.global _main
	.text
_main:
	.global MAX_Y  # external symbol for proper linkage
	.global MAX_X  # external symbol for proper linkage
	.global ALIVE  # external symbol for proper linkage
	push '*'  # push argument to id
	call id
	add rsp, 8  # discard 1 local argument
	mov [ALIVE + rip], rax
	.global DEAD  # external symbol for proper linkage
	push ' '  # push argument to id
	call id
	add rsp, 8  # discard 1 local argument
	mov [DEAD + rip], rax
	.global screen  # external symbol for proper linkage
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	push rax  # result of list
	push [ALIVE + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	push rax  # result of list
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	push rax  # result of list
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	push rax  # result of list
	push [ALIVE + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	push [DEAD + rip]  # push global variable
	push [ALIVE + rip]  # push global variable
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	push rax  # result of list
	mov r13, 5  # list of length 5
	call list
	add rsp, 40  # discard 5 local arguments
	mov [screen + rip], rax
	.global make_empty_row  # external symbol for proper linkage
	.global display_row  # external symbol for proper linkage
	.global display_grid  # external symbol for proper linkage
	.global get_neighboring_coords  # external symbol for proper linkage
	.global valid_coord?  # external symbol for proper linkage
	.global get_all_neighbors  # external symbol for proper linkage
	.global cell_coords_valid?  # external symbol for proper linkage
	.global get_neighbors  # external symbol for proper linkage
	.global update_cell  # external symbol for proper linkage
	.global update_grid  # external symbol for proper linkage
	call start_curses
	add rsp, 0  # discard 0 local arguments
	.global main  # external symbol for proper linkage
	push [screen + rip]  # push global variable
	call main
	add rsp, 8  # discard 1 local argument
	call end_curses
	add rsp, 0  # discard 0 local arguments
	xor rdi, rdi
	mov rax, 0x2000001
	syscall
make_empty_row:
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
	push [rbp + 32]  # push argument to make_empty_row
	push [rbp + 24]  # push argument to cons
	push [rbp + 32]  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push [rbp + 16]  # push argument to sub1
	call sub1
	add rsp, 8  # discard 1 local argument
	push rax  # result of sub1
	call make_empty_row
	add rsp, 24  # discard 3 local arguments
	jmp end_3
	end_3:
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
	je true_4  # true branch
	jmp false_5  # false branch
	true_4:
	mov rax, 0
	jmp end_6
	false_5:
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
	jmp end_6
	end_6:
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
	je true_7  # true branch
	jmp false_8  # false branch
	true_7:
	mov rax, 0
	jmp end_9
	false_8:
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
	jmp end_9
	end_9:
	mov rsp, rbp
	pop rbp
	ret
get_neighboring_coords:
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
	mov rsp, rbp
	pop rbp
	ret
valid_coord?:
	push rbp
	mov rbp, rsp
	push [MAX_X + rip]  # push global variable
	push [rbp + 24]  # push argument to >
	call greater
	add rsp, 16  # discard 2 local arguments
	push rax  # result of >
	push 0  # push argument to <
	push [rbp + 24]  # push argument to <
	call smaller
	add rsp, 16  # discard 2 local arguments
	push rax  # result of <
	call bool_or
	add rsp, 16  # discard 2 local arguments
	push rax  # result of or
	push [MAX_Y + rip]  # push global variable
	push [rbp + 16]  # push argument to >
	call greater
	add rsp, 16  # discard 2 local arguments
	push rax  # result of >
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
	mov rsp, rbp
	pop rbp
	ret
get_all_neighbors:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to get_neighboring_coords
	push [rbp + 16]  # push argument to get_neighboring_coords
	call get_neighboring_coords
	add rsp, 16  # discard 2 local arguments
	push rax  # result of get_neighboring_coords
	jmp after_anonymous_1
	anonymous_1:
	push rbp
	mov rbp, rsp
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
	call valid_coord?
	add rsp, 16  # discard 2 local arguments
	mov rsp, rbp
	pop rbp
	ret
	after_anonymous_1:
	lea rax, [anonymous_1 + rip]
	push rax
	call filter
	mov rsp, rbp
	pop rbp
	ret
cell_coords_valid?:
	push rbp
	mov rbp, rsp
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
	call valid_coord?
	mov rsp, rbp
	pop rbp
	ret
get_neighbors:
	push rbp
	mov rbp, rsp
	push [rbp + 32]  # push argument to get_all_neighbors
	push [rbp + 24]  # push argument to get_all_neighbors
	call get_all_neighbors
	add rsp, 16  # discard 2 local arguments
	push rax  # result of get_all_neighbors
	lea rsi, [cell_coords_valid? + rip]  # address of procedure cell_coords_valid?
	push rsi
	call filter
	mov rsp, rbp
	pop rbp
	ret
update_cell:
	push rbp
	mov rbp, rsp
	push [ALIVE + rip]  # push global variable
	push [rbp + 16]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_10  # true branch
	jmp false_11  # false branch
	true_10:
	push 3  # push argument to >
	push [rbp + 24]  # push argument to >
	call greater
	add rsp, 16  # discard 2 local arguments
	push rax  # result of >
	push 2  # push argument to <
	push [rbp + 24]  # push argument to <
	call smaller
	add rsp, 16  # discard 2 local arguments
	push rax  # result of <
	call bool_or
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_13  # true branch
	jmp false_14  # false branch
	true_13:
	mov rax, [DEAD + rip]
	jmp end_15
	false_14:
	mov rax, [ALIVE + rip]
	jmp end_15
	end_15:
	jmp end_12
	false_11:
	push 3  # push argument to eq?
	push [rbp + 24]  # push argument to eq?
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_16  # true branch
	jmp false_17  # false branch
	true_16:
	mov rax, [ALIVE + rip]
	jmp end_18
	false_17:
	mov rax, [DEAD + rip]
	jmp end_18
	end_18:
	jmp end_12
	end_12:
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
	je true_19  # true branch
	jmp false_20  # false branch
	true_19:
	mov rax, [rbp + 16]
	jmp end_21
	false_20:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_22  # true branch
	jmp false_23  # false branch
	true_22:
	push 0  # push argument to update_grid
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call update_grid
	add rsp, 24  # discard 3 local arguments
	jmp end_24
	false_23:
	push [rbp + 32]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 24]  # push argument to update_grid
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call update_grid
	add rsp, 24  # discard 3 local arguments
	push rax  # result of update_grid
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	push [rbp + 32]  # push argument to get_neighbors
	push [rbp + 24]  # push argument to get_neighbors
	push [rbp + 16]  # push argument to get_neighbors
	call get_neighbors
	add rsp, 24  # discard 3 local arguments
	push rax  # result of get_neighbors
	call length
	add rsp, 8  # discard 1 local argument
	push rax  # result of length
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call update_cell
	add rsp, 16  # discard 2 local arguments
	push rax  # result of update_cell
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call cons
	add rsp, 16  # discard 2 local arguments
	jmp end_24
	end_24:
	jmp end_21
	end_21:
	mov rsp, rbp
	pop rbp
	ret
main:
	push rbp
	mov rbp, rsp
	push 0  # push argument to display_grid
	push [rbp + 16]  # push argument to display_grid
	call display_grid
	add rsp, 16  # discard 2 local arguments
	call refresh
	add rsp, 0  # discard 0 local arguments
	push 500  # push argument to nap
	call nap
	add rsp, 8  # discard 1 local argument
	push 0  # push argument to update_grid
	push 0  # push argument to update_grid
	push [rbp + 16]  # push argument to update_grid
	call update_grid
	add rsp, 24  # discard 3 local arguments
	push rax  # result of update_grid
	call main
	add rsp, 8  # discard 1 local argument
	push rax  # result of main
	mov rsp, rbp
	pop rbp
	ret

	.data
MAX_Y:
	.quad 5
MAX_X:
	.quad 5
ALIVE:
	.quad '*'
DEAD:
	.quad ' '
screen:
	.quad 0
