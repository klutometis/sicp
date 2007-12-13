;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "integrate-series.scm")

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))
