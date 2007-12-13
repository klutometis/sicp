;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "transform-painter.scm")
(load "make-vect.scm")

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0. 0.)
                              split-point
                              (make-vect 0. 1.)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1. 0.)
                              (make-vect 0.5 1.))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))
