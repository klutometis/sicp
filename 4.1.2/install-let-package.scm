(load "put.scm")
(load "let->combination.scm")

(define (install-let-package)
  (put 'let (lambda (exp env) (eval (let->combination exp) env)))
  'done)
