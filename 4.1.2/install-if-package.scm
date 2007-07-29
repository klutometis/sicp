(load "put.scm")
(load "eval-if.scm")

(define (install-if-package)
  (put 'if (lambda (exp env) (eval-if exp env)))
  'done)
