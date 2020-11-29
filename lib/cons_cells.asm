	.global cons, car, cdr, list
	.text

/*

|objekt, pekare till nasta |

408383

string_hash(nil)

Tag on cells, to see if it is a cons
*/

cons:  # r12 = pair, r13 = tail
	push rbp
	mov rbp, rsp
	mov rdi, 16
	and rsp, -16
	call _GC_malloc
	mov r12, rax

	mov rsi, [rbp + 16]
	mov [r12], rsi

	mov r13, [rbp + 24]
	push r13
	call atom?
	add rsp, 8
	cmp rax, 1
	je tail_null
	mov [r12 + 8], r13
	jmp cons_end

	tail_null:
		mov rdi, 16
		and rsp, -16
		call _GC_malloc
		mov [rax], r13
		mov qword ptr [rax + 8], 408383
		mov [r12 + 8], rax

	cons_end:
		mov rax, r12
		mov rsp, rbp
		pop rbp
		ret

car:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	cmp rax, 408383
	jne car_success
	call car_exception
	car_success:
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

# r12 = index, r13 = length, r14 = prev tail, r15 = saved beginning
list:
	push rbp
	mov rbp, rsp
	and rsp, -16

	mov r12, 1

	mov rdi, 16
	call _GC_malloc
	mov r15, rax
	
	mov rsi, [rbp + 16]
	mov [rax], rsi

	cmp r13, 1
	je end_list

	lea r14, [rax + 8]
	
	make_list:
		mov rdi, 16
		call _GC_malloc
		mov rsi, [rbp + (r12 * 8) + 16]
		mov [rax], rsi

		inc r12

		mov [r14], rax
		lea r14, [rax + 8]

		cmp r12, r13
		je end_list
		jmp make_list

	end_list:
		mov qword ptr [rax + 8], 408383
		mov rax, r15
		mov rsp, rbp
		pop rbp
		ret