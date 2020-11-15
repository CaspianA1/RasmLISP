	.text
	call _begin_gc
	and rsp, -16  # begin garbage collector
	.global MAX_NUM  # external symbol for proper linkage
	.global nil  # external symbol for proper linkage
	.global list?  # external symbol for proper linkage
	.global lat?  # external symbol for proper linkage
	.global map  # external symbol for proper linkage
	.global filter  # external symbol for proper linkage
	.global reduce  # external symbol for proper linkage
	.global display_list  # external symbol for proper linkage
	.global length  # external symbol for proper linkage
	.global sum  # external symbol for proper linkage
	.global max  # external symbol for proper linkage
	.global display  # external symbol for proper linkage
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
lat?:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_1  # true branch
	jmp false_2  # false branch
	true_1:
	mov rax, 1
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
	mov rax, 0
	jmp end_6
	false_5:
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call lat?
	add rsp, 8  # discard 1 local argument
	jmp end_6
	end_6:
	jmp end_3
	end_3:
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
filter:
	push rbp
	mov rbp, rsp
	push [rbp + 24]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_10  # true branch
	jmp false_11  # false branch
	true_10:
	mov rax, [rbp + 24]
	jmp end_12
	false_11:
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	mov rsi, [rbp + 16]
	call rsi
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_13  # true branch
	jmp false_14  # false branch
	true_13:
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	push [rbp + 16]  # push argument to filter
	call filter
	add rsp, 16  # discard 2 local arguments
	push rax  # result of filter
	push [rbp + 24]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call cons
	add rsp, 16  # discard 2 local arguments
	jmp end_15
	false_14:
	push [rbp + 24]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	push [rbp + 16]  # push argument to filter
	call filter
	add rsp, 16  # discard 2 local arguments
	jmp end_15
	end_15:
	jmp end_12
	end_12:
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
	je true_16  # true branch
	jmp false_17  # false branch
	true_16:
	mov rax, [rbp + 32]
	jmp end_18
	false_17:
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
	mov rsi, [rbp + 16]
	call rsi
	add rsp, 16  # discard 2 local arguments
	jmp end_18
	end_18:
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
	je true_19  # true branch
	jmp false_20  # false branch
	true_19:
	push ''  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	push ')'  # push argument to display_char
	call display_char
	add rsp, 8  # discard 1 local argument
	mov rax, 0
	jmp end_21
	false_20:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call list?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_22  # true branch
	jmp false_23  # false branch
	true_22:
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
	jmp end_24
	false_23:
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call display_num
	add rsp, 8  # discard 1 local argument
	jmp end_24
	end_24:
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
	jmp end_21
	end_21:
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
_length:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to null?
	call null?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_25  # true branch
	jmp false_26  # false branch
	true_25:
	mov rax, [rbp + 24]
	jmp end_27
	false_26:
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
	jmp end_27
	end_27:
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
	je true_28  # true branch
	jmp false_29  # false branch
	true_28:
	mov rax, [rbp + 24]
	jmp end_30
	false_29:
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
	jmp end_30
	end_30:
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
	je true_31  # true branch
	jmp false_32  # false branch
	true_31:
	mov rax, [rbp + 24]
	jmp end_33
	false_32:
	push [rbp + 24]  # push argument to >
	push [rbp + 16]  # push argument to car
	call car
	add rsp, 8  # discard 1 local argument
	push rax  # result of car
	call greater
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_34  # true branch
	jmp false_35  # false branch
	true_34:
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
	jmp end_36
	false_35:
	push [rbp + 24]  # push argument to _max
	push [rbp + 16]  # push argument to cdr
	call cdr
	add rsp, 8  # discard 1 local argument
	push rax  # result of cdr
	call _max
	add rsp, 16  # discard 2 local arguments
	jmp end_36
	end_36:
	jmp end_33
	end_33:
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
display:
	push rbp
	mov rbp, rsp
	push [rbp + 16]  # push argument to atom?
	call atom?
	add rsp, 8  # discard 1 local argument
	cmp rax, 1  # is true?
	je true_37  # true branch
	jmp false_38  # false branch
	true_37:
	push [rbp + 16]  # push argument to display_num
	call display_num
	add rsp, 8  # discard 1 local argument
	jmp end_39
	false_38:
	push [rbp + 16]  # push argument to display_list
	call display_list
	add rsp, 8  # discard 1 local argument
	jmp end_39
	end_39:
	mov rsp, rbp
	pop rbp
	ret

	.data
MAX_NUM:
	.quad 2147483647
nil:
	.quad '\0'
