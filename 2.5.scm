#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.5][2\.5:1]]

(use test)

(define (divides? n d) (zero? (modulo n d)))

(define (multiplicity n d)
  (let iter ((n n)
             (m 0))
    (if (divides? n d)
        (iter (/ n d) (+ m 1))
        m)))

;; Strange things happen if we don't prefix these.
(define (n-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (n-car n)
  (multiplicity n 2))

(define (n-cdr n)
  (multiplicity n 3))

(let ((pair (n-cons 3 4)))
  (test 3 (n-car pair))
  (test 4 (n-cdr pair)))

;; 2\.5:1 ends here
