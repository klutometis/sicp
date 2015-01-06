#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.37][1\.37:1]]

;;; Off by one?
(define (cont-frac n d k)
  ;; i is necessary to evaluate the terms in order.
  (let iter ((i 0))
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1)))))))

;; 1\.37:1 ends here
