(load "put.scm")
(load "eval-do.scm")

(define (install-do-package)
  (put 'do (lambda (exp env) (eval-do exp env)))
  'done)
