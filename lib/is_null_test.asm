	.global _main
	.include "linked_lists.asm"
	.text

is_null:
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]
	mov rsi, [rsi]
	cmp rsi, '\0'
	je it_is_null
	mov rax, 0
	jmp is_null_end
	it_is_null:
		mov rax, 1
	is_null_end:
		mov rsp, rbp
		pop rbp
		ret

/* in lisp, call the `list` function `list_of`*/
/* error with a list length of 1 for make_list */
/* an empty list = a pointer to '\0'
(can't be made until I can have a list with one element)
make it possible to have a single-element list that is "empty" (think about this one)
an empty list will be this: a pointer to '\0'
figure out how to create it now
make a special function empty-list if the normal one doesn't work for my normal intents and purposes
*/
_main:
	
	/*
	mov r13, 2
	push 5
	push 4
	call make_list
	add rsp, 16
	mov rax, [rax + 8]

	mov r8, [rax]  # r8 = 5
	mov r9, [rax + 8]  # r9 = '\0'
	*/

	# making an empty list:
	mov rdi, 8
	call _malloc
	# fix the 2-element problem from here
	
	mov rdi, 0
	mov rax, 0x2000001
	syscall
