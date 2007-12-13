;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "edge1-frame.scm")
(load "edge2-frame.scm")
(load "origin-frame.scm")
(load "scale-vect.scm")
(load "add-vect.scm")
(load "xcor-vect.scm")
(load "ycor-vect.scm")

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))
