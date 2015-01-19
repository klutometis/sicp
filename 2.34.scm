#!/usr/bin/env chicken-scheme

(use sicp test)

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

(test 79 (horner-eval 2 (list 1 3 0 5 0 1)))
