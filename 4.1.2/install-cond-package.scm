(load "put.scm")
(load "cond->if.scm")

(define (install-cond-package)
  (put 'cond (lambda (exp env) (eval (cond->if exp env) env)))
  'done)
