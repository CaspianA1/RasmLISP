	.global _main, list_of, car, cdr, null?
	.include "lib/GC/gc_wrapper.asm"
	.text

list_of:
	push rbp
	mov rbp, rsp
	mov r12, 16
	mov rbx, 1  # 1 for first time

	and rsp, -16

	recur_make_list:
		mov edi, 24
		call _allocate
		mov r8, rax  # save r8 for when rax is overwritten by `atom?`

		push [rbp + r12]
		call atom?
		add rsp, 8
		inc rax

		mov [r8], rax
		mov rsi, [rbp + r12]
		mov [r8 + 8], rsi
		mov rax, r8

		add r12, 8
		dec r13

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
		mov qword ptr [rax + 16], '\0'  # reverted back to '\0', as 48 is less common than 0
		mov [r14], rax
		mov rax, r15
		mov rsp, rbp
		pop rbp
		ret

car:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]  # first arg on stack
	mov rax, [rax + 8]
	mov rsp, rbp
	pop rbp
	ret

cdr:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]  # first arg on stack
	cmp rax, '\0'
	je cdr_is_null
	jmp cdr_is_fine
	cdr_is_null:
		mov rax, '\0'
		jmp cdr_end
	cdr_is_fine:
		mov rax, [rax + 16]
	cdr_end:
		mov rsp, rbp
		pop rbp
		ret

null?:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	cmp rax, '\0'
	je is_null
	jmp is_not_null
	is_null:
		mov rax, 1
		jmp null?_end
	is_not_null:
		mov rax, 0
	null?_end:
		mov rsp, rbp
		pop rbp
		ret