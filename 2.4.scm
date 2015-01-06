#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.4][2\.4:1]]

(use test)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(let ((pair (cons 1 2)))
  (test 1 (car pair))
  (test 2 (cdr pair)))

;; 2\.4:1 ends here
