;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-tableau.scm")

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))
