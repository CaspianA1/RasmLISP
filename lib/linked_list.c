#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#define IMPORTED

typedef struct Node Node;
struct Node {
	int head; // make to a union later
	Node* tail;
};

//////////
Node cons(int curr, Node* next) {Node cell = {curr, next}; return cell;}
int car(Node node) {return node.head;}
Node* cdr(Node node) {return node.tail;}

//////////
Node* make_pairs(va_list args, int argc) {
	Node* linked_list = calloc(argc, sizeof(Node));
	linked_list -> head = va_arg(args, int);
	if (argc == 1) {
		linked_list -> tail = NULL;
		return linked_list;
	}

	Node* tail = calloc(argc - 1, sizeof(Node));
	tail = make_pairs(args, argc - 1);
	linked_list -> tail = tail;

	return linked_list;
}

void free_pairs(Node* node) {
	Node* curr_node = node;
	while (curr_node) {
		Node* temp = curr_node;
		curr_node = curr_node -> tail;
		free(temp);
	}
}

//////////
Node* list(int length, ...) {
	va_list elems;
	va_start(elems, length);
	Node* linked_list = make_pairs(elems, length);
	va_end(elems);
	return linked_list;
}

//////////
void print_elems(Node node) {
	printf("%d", node.head);
	if (node.tail == NULL) return;
	printf(" ");
	print_elems(*node.tail);
}

void print_list(Node node) {
	printf("(");
	print_elems(node);
	printf(")\n");
}
//////////

#ifndef IMPORTED
int main() {
		Node* big_list = list(5, 1, 2, 3, 4, 5,
		6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20); // how to free this?
		print_list(*big_list);
		free_pairs(big_list);
}
#endif