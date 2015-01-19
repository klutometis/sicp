#!/usr/bin/env chicken-scheme

;;; Off by one?
(define (cont-frac n d k)
  ;; i is necessary to evaluate the terms in order.
  (let iter ((i 0))
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1)))))))
