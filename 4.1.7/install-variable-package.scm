(load "put.scm")
(load "lookup-variable-value.scm")

(define (install-variable-package)
  (define (analyze-variable exp)
    (lambda (env) (lookup-variable-value exp env)))
  (put 'variable analyze-variable)
  'done)
