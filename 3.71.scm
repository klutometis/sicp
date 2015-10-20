#!/usr/bin/env chicken-scheme
(use bindings sicp-streams test)

(include "stream-map.scm")
(include "weighted-pairs.scm")

(let* ((weight (bind-lambda (i j) (+ (expt i 3) (expt j 3))))
       (weighted-pairs (stream-map weight (weighted-pairs weight integers integers))))
  (test '(1729 4104 13832 20683 32832 39312)
        (stream->list
         (stream-filter
          identity
          (stream-map (lambda (x y) (and (= x y) x))
                      weighted-pairs
                      (stream-cdr weighted-pairs)))
         6)))
