#!/usr/bin/env chicken-scheme
(use bindings sicp sicp-streams test)

(include "stream-map.scm")
(include "weighted-pairs.scm")

(define (square-pair p)
  (+ (square (car p))
     (square (cadr p))))

(let* ((weight (bind-lambda (i j) (+ (expt i 2) (expt j 2))))
       (weighted-pairs (weighted-pairs weight integers integers)))
  (test '(((10 15) (6 17) (1 18))
          ((13 16) (8 19) (5 20))
          ((17 19) (11 23) (5 25))
          ((14 23) (10 25) (7 26))
          ((19 22) (13 26) (2 29))
          ((15 25) (11 27) (3 29)))
        (stream->list
         (stream-filter
          identity
          (stream-map (lambda (p1 p2 p3)
                        (and (= (square-pair p1)
                                (square-pair p2))
                             (= (square-pair p2)
                                (square-pair p3))
                             (list p1 p2 p3)))
                      weighted-pairs
                      (stream-cdr weighted-pairs)
                      (stream-cdr (stream-cdr weighted-pairs))))
         6)))
