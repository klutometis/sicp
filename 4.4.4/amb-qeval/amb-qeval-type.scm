;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-type
  '(define (amb-qeval-type exp)
     (if (pair? exp)
         (car exp)
         (error "Unknown expression TYPE" exp))))
