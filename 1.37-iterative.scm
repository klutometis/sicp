#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.37][1\.37:1]]

(use test)

(define (cont-frac n d k)
  (let iter ((result (/ (n 0) (d 0)))
             (i k))
    (if (zero? i)
        result
        (iter (/ (n i) (+ (d i) result))
              (- i 1)))))

(test 0.61803 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 13))

;; 1\.37:1 ends here
