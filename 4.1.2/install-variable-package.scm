(load "put.scm")
(load "lookup-variable-value.scm")

(define (install-variable-package)
  (put 'variable (lambda (exp env) (lookup-variable-value exp env)))
  'done)
