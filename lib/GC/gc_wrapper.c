#include "tgc/tgc.c"

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