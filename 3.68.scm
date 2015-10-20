#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

(test-assert (not (terminates? (lambda () (pairs integers integers)))))
