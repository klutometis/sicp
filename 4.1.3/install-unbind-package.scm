(load "put.scm")
(load "eval-unbind.scm")

(define (install-unbind-package)
  (put 'unbind! (lambda (exp env) (eval-unbind exp env)))
  'done)
