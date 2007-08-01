(load "put.scm")
(load "letrec->let.scm")
(load "analyze.scm")

(define (install-letrec-package)
  (define (analyze-letrec exp)
    (analyze (letrec->let exp)))
  (put 'letrec analyze-letrec)
  'done)
