CC = clang

all: c asm

c:
	$(CC) -S -O1 -masm=intel -o gc_wrapper.asm gc_wrapper.c
asm:
	$(CC) -masm=intel -o collector collector.asm