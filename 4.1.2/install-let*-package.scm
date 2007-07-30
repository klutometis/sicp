(load "put.scm")
(load "let*->nested-lets.scm")

(define (install-let*-package)
  (put 'let* (lambda (exp env) (eval (let*->nested-lets exp) env)))
  'done)
