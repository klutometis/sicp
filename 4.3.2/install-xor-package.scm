(load "put.scm")
(load "analyze.scm")
(load "xor->and-or.scm")

(define (install-xor-package)
  (define (analyze-xor exp)
    (analyze (xor->and-or exp)))
  (put 'xor analyze-xor)
  'done)
