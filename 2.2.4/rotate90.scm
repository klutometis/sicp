;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "transform-painter.scm")
(load "make-vect.scm")

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1. 0.)
                     (make-vect 1. 1.)
                     (make-vect 0. 0.)))
