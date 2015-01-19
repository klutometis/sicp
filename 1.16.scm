#!/usr/bin/env chicken-scheme

(use test)

(define (square n) (* n n))

;; TODO: I'm uncomfortable with these special cases here; a better
;; way?
(define (fast-expt b n)
  (cond ((zero? n) 1)
        ((= n 1) b)
        (else (fast-expt-iter b n 1))))

(define (fast-expt-iter b n a)
  (cond ((= n 1) a)
        ((even? n)
         (fast-expt-iter b (/ n 2) (* (square b) a)))
        (else (fast-expt-iter b (- n 1) (* b a)))))

(test 1 (fast-expt 2 0))
(test 2 (fast-expt 2 1))
(test 4 (fast-expt 2 2))
(test 8 (fast-expt 2 3))
(test 16 (fast-expt 2 4))
(test 32 (fast-expt 2 5))
