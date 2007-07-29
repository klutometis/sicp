(load "put.scm")

(define (install-self-evaluating-package)
  (put 'self-evaluating (lambda (exp env) exp))
  'done)

