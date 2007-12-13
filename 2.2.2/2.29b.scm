;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "mobile.scm")

(define mobile (make-mobile (make-branch 1 (make-mobile (make-branch 1 2) (make-branch 2 3))) (make-branch 2 3)))
(total-weight mobile)
