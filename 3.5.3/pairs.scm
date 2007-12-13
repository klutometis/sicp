;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interleave.scm")
(load "generalized-pairs.scm")

(define (pairs s t)
  (generalized-pairs s t interleave))
