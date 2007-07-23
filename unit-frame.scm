(load "make-frame.scm")
(load "make-vect.scm")

(define unit-frame (make-frame
                    (make-vect 0. 0.)
                    (make-vect 1. 0.)
                    (make-vect 0. 1.)))
