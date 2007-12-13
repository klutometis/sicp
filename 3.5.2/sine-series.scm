;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "integrate-series.scm")

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
