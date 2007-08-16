(define amb-qeval-tagged-list?
  '(define (amb-qeval-tagged-list? exp tag)
     (if (pair? exp)
         (eq? (car exp) tag)
         false)))
