(load "put.scm")

(define (install-cond-package)
  (define (analyze-cond exp)
    (lambda (env) (error "Not implemented -- COND")))
  (put 'cond analyze-cond)
  'done)
