#include <stdlib.h>
#include <stdio.h>

typedef struct {
	int num_elems, length;
	int* internal;
} Stack;

Stack* make_stack(int init_length) {
	Stack* stack = malloc(sizeof(Stack));
	stack -> num_elems = 0;
	stack -> length = init_length;
	stack -> internal = malloc(init_length * sizeof(int));
	return stack;
}

void push(Stack* stack, int elem) {
	if (++stack -> num_elems == stack -> length)
		stack -> internal = realloc(stack -> internal, ++(stack -> length) * sizeof(int));

	stack -> internal[stack -> num_elems - 1] = elem;
}

int pop(Stack* stack) {
	int top = stack -> internal[stack -> num_elems - 1];
	if (stack -> num_elems != 0)
		stack -> internal[--stack -> num_elems] = 0;
	else
		perror("Cannot pop from an empty stack");
	return top;
}

void delete_stack(Stack* stack) {
	free(stack -> internal);
	free(stack);
}


int main() {

}