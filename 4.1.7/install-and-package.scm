(load "put.scm")

(define (install-and-package)
  (define (analyze-and exp)
    (lambda (env) (error "Not implemented -- AND")))
  (put 'and analyze-and)
  'done)
