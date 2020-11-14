	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	push 408383
	call display_num
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	push 4  # push argument to cons
	push 3  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 2  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 1  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	mov [sequence + rip], rax
	push 10  # push argument to cons
	push 9  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 8  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	push 7  # push argument to cons
	call cons
	add rsp, 16  # discard 2 local arguments
	push rax  # result of cons
	lea rsi, [add1 + rip]  # address of procedure add1
	push rsi
	call map
	add rsp, 16  # discard 2 local arguments
	push rax  # result of map
	call display_list
	add rsp, 8  # discard 1 local argument
	call newline
	add rsp, 0  # discard 0 local arguments
	push [sequence + rip]  # push global variable
	call display_list
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
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
_display_list:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	push ''  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push ')'  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	mov rax, 0
	jmp end_3
	false_2:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call list?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_4  # true branch
	jmp false_5  # false branch
	true_4:
	push '('  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call _display_list
	add rsp, 8  # discard 1 local argument
	push rax  # result of _display_list
	jmp end_6
	false_5:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call display_num
	add rsp, 8  # discard 1 local argument
	jmp end_6
	end_6:
	push ' '  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _display_list
	add rsp, 8  # discard 1 local argument
	push rax  # result of _display_list
	jmp end_3
	end_3:
	mov rsp, rbp
	pop rbp
	ret
display_list:
	push rbp
	mov rbp, rsp
	push '('  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push [rbp + 16]  # push argument to _display_list
	call _display_list
	add rsp, 8  # discard 1 local argument
	push rax  # result of _display_list
	mov rsp, rbp
	pop rbp
	ret
map:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_7  # true branch
	jmp false_8  # false branch
	true_7:
	mov rax, [rbp + 24]
	jmp end_9
	false_8:
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	push [rbp + 16]  # push argument to map
	call map
	add rsp, 16  # discard 2 local arguments
	push rax  # result of map
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	mov rsi, [rbp + 16]
	call rsi
	add rsp, 8  # discard 1 local argument
	push rax  # result of [rbp + 16]
	call cons
	add rsp, 16  # discard 2 local arguments
	jmp end_9
	end_9:
	mov rsp, rbp
	pop rbp
	ret

	.data
sequence:
	.quad 0
