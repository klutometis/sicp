#!/usr/bin/env chicken-scheme
(use sicp test)

(include "sqrt.scm")

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter/new-if guess x)
  (new-if (good-enough? (square guess) x)
          guess
          (sqrt-iter/new-if (improve guess x) x)))

(parameterize ((current-test-epsilon 0.0001)
               (epsilon 0.01))
  (test "Iterative square-root" 3.0 (sqrt-newton 9)))

(test-assert
 "Iterative square-root with applicative conditional"
 (not (terminates? (lambda () (sqrt-newton sqrt-iter/new-if 9)))))
