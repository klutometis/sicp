(load "accumulate.scm")

(define (fold-right op init seq)
  (accumulate op init seq))
