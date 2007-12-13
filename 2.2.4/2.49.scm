;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-frame.scm")
(load "make-vect.scm")
(load "segments->painter")
(load "painters.scm")

;; Unit frame at origin
(define frame (make-frame (make-vect 0 0) (make-vect 0 1) (make-vect 1 0)))

(for-each (lambda (painter) ((segments->painter painter) frame))
          (list outline x diamond wave))
