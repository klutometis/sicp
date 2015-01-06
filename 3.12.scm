#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.12][3\.12:1]]

(use test)

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define x '(a b))
(define y '(c d))
(define z (append x y))
(test '(b) (cdr x))

(define w (append! x y))
(test '(b c d) (cdr x))

;; 3\.12:1 ends here
