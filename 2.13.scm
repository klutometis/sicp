#!/usr/bin/env chicken-scheme
(use test)

(include "interval-percent.scm")

(let* ((p 0.1)
       (i (make-center-percent 6.8 p)))
  (parameterize ((current-test-epsilon 0.01))
    (test (+ p p) (percent (mul-interval i i)))))
