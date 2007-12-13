;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-contents
  '(define (amb-qeval-contents exp)
     (if (pair? exp)
         (cdr exp)
         (error "Unknown expression CONTENTS" exp))))
