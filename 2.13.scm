#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.13][2\.13:1]]

(use test)

(include "interval-percent.scm")

(let* ((p 0.1)
       (i (make-center-percent 6.8 p)))
  (parameterize ((current-test-epsilon 0.01))
    (test (+ p p) (percent (mul-interval i i)))))

;; 2\.13:1 ends here
