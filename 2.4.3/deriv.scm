(load "variable?.scm")
(load "same-variable?.scm")
(load "operator.scm")
(load "operands.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else
         (let* ((operator (operator exp))
                (proc (get 'deriv operator)))
           (if proc
               (proc (operands exp) var)
               (error "unknown operator -- DERIV" operator))))))
