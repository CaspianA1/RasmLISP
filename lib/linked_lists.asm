	.global _main
	.text

/*
rbx = first time, true or not
r12 = offset
r13 = argument count
r14 = for saving tail address of previous
r15 = accumulator for result
get offset from argument count?
*/

make_list:
	push rbp
	mov rbp, rsp
	mov r12, 16
	mov rdi, 16

	test r13, 1
	jz aligned_malloc
	call _malloc
	jmp init_list_head

	aligned_malloc:
		sub rsp, 8
		call _malloc
		add rsp, 8
		jmp init_list_head

	init_list_head:
		lea r15, [rax]
		mov rsi, [rbp + r12]
		mov qword ptr [rax], rsi
		lea r14, [rax + 8]
		add r12, 8
		sub r13, 1
	recur_making_list:
		mov rdi, 16
		call _malloc
		mov qword ptr [r14], rax
		mov rsi, [rbp + r12]
		mov qword ptr [rax], rsi # current_node.head = argument
		add r12, 8  # offset += 8
		sub r13, 1  # argument_count -= 1
		cmp r13, 0  # if argument_count == 0
		je end_making_list  # end()
		lea r14, [rax + 8]
		jmp recur_making_list
	end_making_list:
		mov qword ptr [rax + 8], '\0'
		mov rax, r15
		mov rsp, rbp
		pop rbp
		ret

car:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	mov rax, [rax]
	mov rsp, rbp
	pop rbp
	ret

cdr:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	mov rax, [rax + 8]
	mov rsp, rbp
	pop rbp
	ret

_main:
	mov r13, 4
	push 4
	push 3
	push 2
	push 1
	call make_list
	add rsp, 16
	mov rdi, 0
	mov rax, 0x2000001
	syscall