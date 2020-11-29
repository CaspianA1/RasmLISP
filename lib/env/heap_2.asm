	.global _main
	.text

/*
r14 = alternative stack (like rbp)
r15 = r14 pointer (like rsp)
this stack will grow upwards
*/

/*
tags:
1 = int
2 = list
3 = function
4 = null pointer
*/

init_env:
	mov rdi, 10000
	and rsp, -16
	call _malloc
	mov r14, rax
	mov r15, r14
	ret

env_push:
	mov [r15], rsi
	mov [r15 + 1], rdi
	add r15, 8
	ret

env_pop:
	sub r15, 8
	mov rcx, [r15]
	mov rax, [r15 + 1]
	ret

_main:
	call init_env
	
	mov rsi, 1
	mov rdi, 25
	call env_push

	call env_pop
	# rax = integer, and rcx = tag

	# each environment will contain only one element in it. this fits with the idea of currying and single-function arguments present in the lambda calculus.

	mov rdi, rcx
	mov rax, 0x2000001
	syscall
