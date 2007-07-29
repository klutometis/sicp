(load "put.scm")
(load "and->if.scm")

(define (install-and-package)
  (put 'and (lambda (exp env) (eval (and->if exp) env)))
  'done)
