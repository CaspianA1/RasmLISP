	.global _main
	.text

_main:
	pop rbx

	push 5  # num args
	push 1
	push 2
	push 3
	push 4
	push 5  # for i in range of all args: add rsp 4 * that num

	mov al, 0
	call _list

	# pop rax
	call _free_pairs

	# get the args on the stack!
	# call _print_list

	push rbx
	mov rdi, 0
	mov rax, 0x2000001
	syscall

# https://stackoverflow.com/questions/13618009/force-gcc-to-push-arguments-on-the-stack-before-calling-function-using-push-ins