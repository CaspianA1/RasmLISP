	.global _main
	.text
_main:
	call newline
	add rsp, 0  # discard 0 local arguments
	mov rdi, 0
	mov rax, 0x2000001
	syscall
list?:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to atom?
	call atom?
	add rsp, 8  # discard 1 local argument
	push rax  # result of atom?
	call bool_not
	mov rsp, rbp
	pop rbp
	ret
_length:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, [rbp + 24]
	jmp end_3
	false_2:
	push [rbp + 24]  # push argument to add1
	call add1
	add rsp, 8  # discard 1 local argument
	push rax  # result of add1
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _length
	add rsp, 16  # discard 2 local arguments
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret
length:
	push rbp
	mov rbp, rsp
	push 0  # push argument to _length
	push [rbp + 16]  # push argument to _length
	call _length
	mov rsp, rbp
	pop rbp
	ret
_sum:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_4  # true branch
	jmp false_5  # false branch
	true_4:
	mov rax, [rbp + 24]
	jmp end_6
	false_5:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 24]  # push argument to +
	call plus
	add rsp, 16  # discard 2 local arguments
	push rax  # result of +
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _sum
	add rsp, 16  # discard 2 local arguments
	jmp end_6
	end_6:
	mov rsp, rbp
	pop rbp
	ret
sum:
	push rbp
	mov rbp, rsp
	push 0  # push argument to _sum
	push [rbp + 16]  # push argument to _sum
	call _sum
	mov rsp, rbp
	pop rbp
	ret
_max:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_7  # true branch
	jmp false_8  # false branch
	true_7:
	mov rax, [rbp + 24]
	jmp end_9
	false_8:
	push [rbp + 24]  # push argument to >
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call greater
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_10  # true branch
	jmp false_11  # false branch
	true_10:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _max
	add rsp, 16  # discard 2 local arguments
	jmp end_12
	false_11:
	push [rbp + 24]  # push argument to _max
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _max
	add rsp, 16  # discard 2 local arguments
	jmp end_12
	end_12:
	jmp end_9
	end_9:
	mov rsp, rbp
	pop rbp
	ret
max:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	push [rbp + 16]  # push argument to _max
	call _max
	mov rsp, rbp
	pop rbp
	ret
reduce:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_13  # true branch
	jmp false_14  # false branch
	true_13:
	mov rax, [rbp + 32]
	jmp end_15
	false_14:
	push [rbp + 32]  # push argument to reduce
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	push [rbp + 16]  # push argument to reduce
	call reduce
	add rsp, 24  # discard 3 local arguments
	push rax  # result of reduce
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call [rbp + 16]
	add rsp, 16  # discard 2 local arguments
	jmp end_15
	end_15:
	mov rsp, rbp
	pop rbp
	ret

	.data
