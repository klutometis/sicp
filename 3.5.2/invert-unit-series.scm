;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "negate-stream.scm")
(load "mul-series.scm")

(define (invert-unit-series series)
  (cons-stream 1 (negate-stream
                  (mul-series
                   (stream-cdr series)
                   (invert-unit-series series)))))
