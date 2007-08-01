(load "put.scm")

(define (install-or-package)
  (define (analyze-or exp)
    (lambda (env) (error "Not implemented -- OR")))
  (put 'or analyze-or)
  'done)
