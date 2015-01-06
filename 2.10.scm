#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.10][2\.10:1]]

(use test)

(include "interval.scm")

(define (div-interval x y)
  (if (xor (positive? (upper-bound y))
           (positive? (lower-bound y)))
      (error "It's not clear what it means to divide by an interval that spans zero.")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(test '(0.0 . 0.0)
      (div-interval (make-interval 0 0) (make-interval 1 1)))

(test-error (div-interval (make-interval 0 0)
                          (make-interval -1 1)))

;; 2\.10:1 ends here
