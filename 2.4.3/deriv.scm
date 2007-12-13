;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "variable?.scm")
(load "same-variable?.scm")
(load "operator.scm")
(load "operands.scm")
(load "get.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else
         (let* ((operator (operator exp))
                (proc (get 'deriv operator)))
           (if proc
               (proc (operands exp) var)
               (error "unknown operator -- DERIV" operator))))))
