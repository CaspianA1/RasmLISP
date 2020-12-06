#include <stdlib.h>
#include <stdio.h>

//////////

typedef struct {
	const char* name;
	void* value;
} stack_elem;

typedef struct {
	int num_elems, length;
	stack_elem* internal;
} Stack;

Stack* make(int init_length) {
	Stack* stack = malloc(sizeof(Stack));
	stack -> num_elems = 0;
	stack -> length = init_length;
	stack -> internal = malloc(init_length * sizeof(stack_elem));
	return stack;
}

void push(Stack* stack, stack_elem elem) {
	if (++stack -> num_elems == stack -> length)
		stack -> internal = realloc(stack -> internal, ++(stack -> length) * sizeof(stack_elem));

	stack -> internal[stack -> num_elems - 1] = elem;
}

stack_elem pop(Stack* stack) {
	stack_elem top = stack -> internal[stack -> num_elems - 1];
	if (stack -> num_elems != 0)
		// stack -> internal[--stack -> num_elems] = NULL;
		stack -> num_elems--;
	else
		perror("Cannot pop from an empty stack");
	return top;
}

void delete(Stack* stack) {
	free(stack -> internal);
	free(stack);
}

//////////

typedef struct {
	Stack* parent_stack;
	Stack current_stack;
} SpaghettiStack;

void* lookup_variable(SpaghettiStack environment) {
	return NULL;
}

int main() {

}