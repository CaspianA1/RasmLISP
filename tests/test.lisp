; (define test_list (list_of 4 (list_of 5 6 (list_of 7 8)) 9))
; (define test_list (list_of 4 (list_of 5 6) 8))
; (display_a_list test_list)

(define nums (list_of 1 2))
(define result (null? (cdr (cdr nums))))
(display_num result)
(newline)