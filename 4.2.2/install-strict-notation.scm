(load "put.scm")
(load "actual-value.scm")

(define (install-strict-notation)
  (put 'strict actual-value)
  'done)
