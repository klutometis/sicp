;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "comb-vect.scm")

(define (add-vect v1 v2)
  (comb-vect v1 v2 +))

;; (add-vect (make-vect 1 2) (make-vect 3 4))
