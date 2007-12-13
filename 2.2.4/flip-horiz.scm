;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-vect.scm")
(load "transform-painter.scm")

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1. 0.)
                     (make-vect 0. 0.)
                     (make-vect 1. 1.)))
