(define amb-qeval-contents
  '(define (amb-qeval-contents exp)
     (if (pair? exp)
         (cdr exp)
         (error "Unknown expression CONTENTS" exp))))
