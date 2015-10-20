#!/usr/bin/env chicken-scheme
(use numbers)

;;; Use Knuth's; see
;;; <http://en.wikipedia.org/wiki/Linear_congruential_generator>.
(define modulus (make-parameter (expt 2 64)))
(define multiplier (make-parameter 6364136223846793005))
(define increment (make-parameter 1442695040888963407))

(define (rand-update x)
  (modulo (+ (* (multiplier) x) (increment)) (modulus)))
