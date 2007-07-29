(load "put.scm")
(load "eval-definition.scm")

(define (install-definition-package)
  (put 'define (lambda (exp env) (eval-definition exp env)))
  'done)
