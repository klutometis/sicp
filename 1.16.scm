#!/usr/bin/env chicken-scheme
(use sicp test)

(define (fast-expt b n)
  (let iter ((b b) (n n) (a 1))
    (cond ((zero? n) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* b a))))))

(test 1 (fast-expt 2 0))
(test 2 (fast-expt 2 1))
(test 4 (fast-expt 2 2))
(test 8 (fast-expt 2 3))
(test 16 (fast-expt 2 4))
(test 32 (fast-expt 2 5))
