(load "put.scm")

(define (install-begin-package)
  (define (analyze-begin exp)
    (lambda (env) (error "Not implemented -- BEGIN")))
  (put 'begin analyze-begin)
  'done)
