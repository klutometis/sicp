#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.17][1\.17:1]]

(use test)

(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (fast-* a b)
  (cond ((zero? b) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))

(test 20 (fast-* 4 5))
(test 56 (fast-* 8 7))

;; 1\.17:1 ends here
