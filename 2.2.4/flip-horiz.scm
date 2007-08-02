(load "make-vect.scm")
(load "transform-painter.scm")

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1. 0.)
                     (make-vect 0. 0.)
                     (make-vect 1. 1.)))
