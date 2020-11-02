	.global _main, list_of, car, cdr
	.extern _malloc
	.text

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
		mov qword ptr [rax + 16], 0x00  # 0x00 = the new null!
		mov [r14], rax
		mov rax, r15
		mov rsp, rbp
		pop rbp
		ret

.macro list_access offset
push rbp
mov rbp, rsp
mov rax, [rbp + 16]  # first arg on stack
mov rax, [rax + \offset]
mov rsp, rbp
pop rbp
ret
.endm

car: list_access 8
cdr: list_access 16

/*
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
*/

/*
nodes are 24 bytes: (&type, &elem, ptr_to_next)
*/