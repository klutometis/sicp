#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.8][2\.8:1]]

(use test)

(include "interval.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(test '(1 . 1)
      (sub-interval (make-interval 2 2)
                    (make-interval 1 1)))

;; 2\.8:1 ends here
