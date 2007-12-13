;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "merge-weighted.scm")
(load "generalized-pairs.scm")

(define (weighted-pairs s1 s2 weight)
  (generalized-pairs s1 s2 (lambda (p1 p2) (merge-weighted p1 p2 weight))))
