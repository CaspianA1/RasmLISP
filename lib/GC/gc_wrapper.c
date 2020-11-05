#include "tgc/tgc.c"
#include <stdio.h>

static tgc_t gc;

void begin_gc() {
	int argc = 0;
	tgc_start(&gc, &argc);
}

void* allocate(size_t byte_count) {
	return tgc_alloc(&gc, byte_count);
}

void end_gc() {
	tgc_stop(&gc);
}

int calculation(int n) {
	return n * 3 + 2 - 9 * 62;
}

/*
int main(int argc, char **argv) {
	begin_gc();
 	int* memory = allocate(100);
 	*memory = 23;

 	return *memory;
}
*/