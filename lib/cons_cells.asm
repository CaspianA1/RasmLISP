	.global cons, car, cdr, null?, list
	.include "lib/GC/gc_wrapper.asm"
	.text

cons:  # r12 = pair, r13 = tail
	push rbp
	mov rbp, rsp
	mov rdi, 16
	call _allocate
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
		call _allocate
		mov [rax], r13
		mov qword ptr [rax + 8], '\0'
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

null?:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	cmp rax, '\0'
	je null_true
	xor rax, rax
	jmp null_end
	null_true:
		mov rax, 1
	null_end:
		mov rsp, rbp
		pop rbp
		ret

list:
	push rbp
	mov rbp, rsp
	xor r14, r14

	# rbx, r14 and 15 are safe to use
	# r14 = argument count
	# r15 = index
	# rbx = result
	# need one more for current memory block

	# hm, this is tricky

	end_list:
		mov rax, rbx
		mov rsp, rbp
		pop rbp
		ret