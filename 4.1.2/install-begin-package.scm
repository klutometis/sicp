(load "put.scm")
(load "eval-sequence.scm")
(load "begin-actions.scm")

(define (install-begin-package)
  (put 'begin (lambda (exp env) (eval-sequence (begin-actions exp) env)))
  'done)
