; Bugs:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Can't assign a function to another one:
(define subtract -)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Only prints 1 paren:
(define_macro (display_list x)
	(begin
		(display_char #\()
		(_display_list x)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Incorrect results:
(define (g a) (let ((b 3)) (* a b)))
(display (g 2))
(newline)

(define (f a) ((lambda (b) (* a b)) 3))
(display (f 2)); Weird! Both are wrong. Both are 9 when they should be 6.
; For this to work, that lambda has to be able to capture its surrounding environment.
; 1. How would it do that?
; 2. What is making it behave not as expected right now? (or why is it squaring the first argument?)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GC problems:
|
Overall, I just need faster and more agressive garbage collection
Important flag: ALL_INTERIOR_POINTERS, GC_PRINT_VERBOSE_STATS
How do I enable them?
Can the GC can handle pointers to pointers?

If there is a memory leak:

1. Run the GC for, say, 1000 cycles
2. Then do something else that doesn't utilize the heap, and see if that memory gets freed meanwhile

One-minute memory usage benchmarks:

_GC_malloc, no flags:
267.1 MB

_GC_malloc, ALL_INTERIOR_POINTERS:
423.0 MB

_GC_malloc, no flags, calling GC_enable_incremental in the beginning:
Approximately 200.1 MB
Overall, the program ran a lot slower over time, and there was a lot more heap usage

_malloc:
2.04 GB
|