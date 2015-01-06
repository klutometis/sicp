#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.9][2\.9:1]]

(use test)

(include "interval.scm")

(define (width n)
  (/ (- (upper-bound n) (lower-bound n))
     2))

(let ((n0 (make-interval 0 1))
      (n1 (make-interval 1 0)))
  (let ((w0 (* (width n0)
               (width n1)))
        (w1 (width (mul-interval n0 n1))))
    (test-assert (not (= w0 w1)))))

;; 2\.9:1 ends here
