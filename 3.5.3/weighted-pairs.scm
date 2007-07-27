(load "merge-weighted.scm")
(load "generalized-pairs.scm")

(define (weighted-pairs s1 s2 weight)
  (generalized-pairs s1 s2 (lambda (p1 p2) (merge-weighted p1 p2 weight))))
