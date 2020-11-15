	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
