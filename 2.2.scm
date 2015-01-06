#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.2][2\.2:1]]

(use sicp test)

(include "segment.scm")

(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point (average (x-point start)
                         (x-point end))
                (average (y-point start)
                         (y-point end)))))

(test
 (make-point 1 1)
 (midpoint-segment (make-segment (make-point 0 0)
                                 (make-point 2 2))))

;; 2\.2:1 ends here
