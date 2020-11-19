	.global _main
	.text
_main:
	.global MAX_Y  # external symbol for proper linkage
	.global MAX_X  # external symbol for proper linkage
	.global make_empty_row  # external symbol for proper linkage
	.global display_row  # external symbol for proper linkage
	.global display_grid  # external symbol for proper linkage
	.global get_neighboring_coords  # external symbol for proper linkage
	.global valid_coord?  # external symbol for proper linkage
	.global get_cell  # external symbol for proper linkage
	.global neighbor_count  # external symbol for proper linkage
	.global update_cell  # external symbol for proper linkage
	.global update_grid  # external symbol for proper linkage
	.global empty_grid  # external symbol for proper linkage
	push '.'  # push argument to make_empty_row
	push [nil + rip]  # push global variable
	push [MAX_X + rip]  # push global variable
	call make_empty_row
	add rsp, 24  # discard 3 local arguments
	push rax  # result of make_empty_row
	push [nil + rip]  # push global variable
	push [MAX_Y + rip]  # push global variable
	call make_empty_row
	add rsp, 24  # discard 3 local arguments
	mov [empty_grid + rip], rax
	.global updated  # external symbol for proper linkage
	push 0  # push argument to update_grid
	push 0  # push argument to update_grid
	push [empty_grid + rip]  # push global variable
	call update_grid
	add rsp, 24  # discard 3 local arguments
	mov [updated + rip], rax
	push [updated + rip]  # push global variable
	call display
	add rsp, 8  # discard 1 local argument
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
get_cell:
	push rbp
	mov rbp, rsp
	push [rbp + 32]  # push argument to index
	push [rbp + 24]  # push argument to index
	push [rbp + 16]  # push argument to index
	call index
	add rsp, 16  # discard 2 local arguments
	push rax  # result of index
	call index
	mov rsp, rbp
	pop rbp
	ret
neighbor_count:
	push rbp
	mov rbp, rsp
	push [rbp + 32]  # push argument to get_neighboring_coords
	push [rbp + 24]  # push argument to get_neighboring_coords
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
	add rsp, 16  # discard 2 local arguments
	push rax  # result of filter
	call length
	mov rsp, rbp
	pop rbp
	ret
update_cell:
	push rbp
	mov rbp, rsp
	push ','  # push argument to eq?
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
	mov rax, '.'
	jmp end_15
	false_14:
	mov rax, ','
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
	mov rax, ','
	jmp end_18
	false_17:
	mov rax, '.'
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
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	call update_grid
	add rsp, 24  # discard 3 local arguments
	push rax  # result of update_grid
	push [rbp + 32]  # push argument to neighbor_count
	push [rbp + 24]  # push argument to neighbor_count
	push [rbp + 16]  # push argument to neighbor_count
	call neighbor_count
	add rsp, 24  # discard 3 local arguments
	push rax  # result of neighbor_count
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
	jmp end_24
	end_24:
	jmp end_21
	end_21:
	mov rsp, rbp
	pop rbp
	ret

	.data
MAX_Y:
	.quad 5
MAX_X:
	.quad 10
empty_grid:
	.quad 0
updated:
	.quad 0
