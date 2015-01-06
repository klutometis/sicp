#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.39][1\.39:1]]

(use test)

(include "cont-frac.scm")

(define pi 3.14159265359)

(define (square x) (* x x))

(define (tan-cf x)
  (cont-frac (lambda (i) (if (zero? i) x (- (square x))))
             (lambda (i) (- (* 2 (+ i 1)) 1))
             3))

(test (tan (/ pi 4)) (tan-cf (/ pi 4)))

;; 1\.39:1 ends here
