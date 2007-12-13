;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "make-polynomial.scm")
(load "make-sparse-polynomial.scm")
(load "make-term.scm")
(load "add.scm")
(load "negate.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define minuend
  (make-polynomial 'x (list (make-term 3 4)
                            (make-term 1 2))))

(define subtrahend
  (make-polynomial 'x (list (make-term 7 8)
                            (make-term 1 2))))

(sub minuend subtrahend)
