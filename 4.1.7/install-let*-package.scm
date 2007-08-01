(load "put.scm")

(define (install-let*-package)
  (define (analyze-let* exp)
    (lambda (env) (error "Not implemented -- LET*")))
  (put 'let* analyze-let*)
  'done)
