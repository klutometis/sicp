(define amb-qeval-type
  '(define (amb-qeval-type exp)
     (if (pair? exp)
         (car exp)
         (error "Unknown expression TYPE" exp))))
