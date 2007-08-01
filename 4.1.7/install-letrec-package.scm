(load "put.scm")

(define (install-letrec-package)
  (define (analyze-letrec exp)
    (lambda (env) (error "Not implemented -- LETREC")))
  (put 'letrec analyze-letrec)
  'done)
