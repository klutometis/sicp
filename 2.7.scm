#!/usr/bin/env chicken-scheme
(use test)

(include "interval.scm")

(test '(3 . 3)
      (add-interval (make-interval 1 1)
                    (make-interval 2 2)))
