	.global _main
	.extern _malloc
	.text
	.include "lib.asm"

/*
rbx = first iteration, true or false
r12 = arg offset
r13 = argument count
r14 = for saving tail address of previous
r15 = accumulator for result
*/



.macro argument_to_memory offset
mov rsi, [rbp + r12]
mov [rax + \offset], rsi
add r12, 8
.endm

list_of:
	push rbp
	mov rbp, rsp
	mov r12, 16
	imul r13, 2
	mov rbx, 1  # 1 for first time

	recur_make_list:
		mov rdi, 24
		sub rsp, 8
		call _malloc
		add rsp, 8
		argument_to_memory 0
		argument_to_memory 8
		sub r13, 2

		cmp r13, 0
		je end_make_list

		cmp rbx, 1
		je first_iteration
		jmp rest_of_iterations

		first_iteration:
			mov r15, rax  # save first head
			mov rbx, 0

		rest_of_iterations:
			jne prev_tail_assign
			jmp save_tail  # if equal, don't assign prev
			prev_tail_assign:
				mov [r14], rax # prev tail = curr
			save_tail:
				lea r14, [rax + 16]  # save tail

			jmp recur_make_list

	end_make_list:
		mov qword ptr [rax + 16], '\0'
		mov [r14], rax
		mov rax, r15
		mov rsp, rbp
		pop rbp
		ret

print_list:
	push rbp
	mov rbp, rsp

	recur_print:
	# do stuff here

	end_print:
		mov rsp, rbp
		pop rbp
		ret

car:
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]  # rsi = mem block
	mov rax, [rax + 8]  # rax = data
	mov rsp, rbp
	pop rbp
	ret

cdr:
	push rbp
	mov rbp, rsp

	mov rsi, [rbp + 16]  # rsi = mem block
	mov rdi, [rsi + 16]
	cmp rdi, '\0'  # can't be dereferenced
	je cdr_end

	lea rax, [rdi]

	cdr_end:
		mov rsp, rbp
		pop rbp
		ret

# by seeing whether a type tag is 1 or 2, knowing what to print will be made clear

_main:
	mov r13, 2
	push 40
	push 1
	push 30
	push 1
	call list_of
	add rsp, 32

	mov r13, 2
	push 50
	push 1
	push rax
	push 2
	call list_of
	add rsp, 32

	push rax
	call car
	add rsp, 8

	mov rsi, [rax + 16]
	mov rdi, [rsi + 8]
	mov rax, 0x2000001
	syscall

/*
nodes are 24 bytes: (&type, &elem, ptr_to_next)
*/
