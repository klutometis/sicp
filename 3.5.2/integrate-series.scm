;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "mul-streams.scm")
(load "integers.scm")
(load "invert-stream.scm")

(define (integrate-series series)
  (mul-streams series (invert-stream integers)))

