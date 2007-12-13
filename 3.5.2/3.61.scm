;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "invert-unit-series.scm")
(load "exp-series.scm")
(load "display-stream-n.scm")

(define reinverted-series
  (stream-head (invert-unit-series (invert-unit-series exp-series)) 10))

(test
 "reinverted exp-series"
 (stream-head exp-series 10)
 reinverted-series
 'equal?
 equal?
 "f^-1(f^-1(x)) = f(x)")

