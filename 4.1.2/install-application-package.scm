(load "put.scm")
(load "apply.scm")
(load "list-of-values.scm")
(load "operator.scm")
(load "operands.scm")

(define (install-application-package)
  (put 'application
       (lambda (exp env) (apply (eval (operator exp) env)
                                (list-of-values (operands exp) env))))
  'done)
