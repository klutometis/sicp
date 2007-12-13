;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-vect.scm")
(load "transform-painter.scm")

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1. 1.)
                     (make-vect 0. 1.)
                     (make-vect 1. 0.)))
