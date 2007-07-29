(load "put.scm")
(load "or->if.scm")

(define (install-or-package)
  (put 'or (lambda (exp env) (eval (or->if exp) env)))
  'done)
