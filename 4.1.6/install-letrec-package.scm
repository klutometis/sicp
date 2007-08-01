(load "put.scm")
(load "letrec->let.scm")

(define (install-letrec-package)
  (put 'letrec (lambda (exp env) (eval (letrec->let exp) env)))
  'done)
