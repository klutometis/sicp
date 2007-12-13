;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "mul-series.scm")
(load "invert-unit-series.scm")
(load "integrate-series.scm")

;; Didn't use div-series.
(define tangent-series
  (integrate-series (invert-unit-series (mul-series cosine-series cosine-series))))
