#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.24][3\.24:1]]

(use test)

(include "table.scm")

(define epsilon (make-parameter 0.1))

;; Bad design to use a dynamic variable: could change the semantics of
;; the table during usage; define at `make-approx-equal?'?
(define (approx-equal? x y)
  (< (abs (- x y)) (epsilon)))

(let ((table (make-table approx-equal?)))
  ((table 'insert!) 1.0 'hello)
  (test 'hello ((table 'lookup) 0.99)))

;; 3\.24:1 ends here
