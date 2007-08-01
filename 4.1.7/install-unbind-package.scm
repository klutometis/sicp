(load "put.scm")
(load "eval-unbind.scm")

(define (install-unbind-package)
  (define (analyze-unbind exp)
    (lambda (env) (eval-unbind exp env)))
  (put 'unbind! analyze-unbind)
  'done)
