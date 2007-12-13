;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "make-polynomial.scm")
(load "=zero?.scm")
(load "get.scm")
(load "apply-generic-raise.scm")

(install-packages)
(define polynomial
  (make-polynomial 'x (list (make-term 2 2)
                            (make-term 1 1))))

(define zero-polynomial
  (make-polynomial 'x (list (make-term 2 0)
                            (make-term 1 0))))

(=zero? polynomial)
(=zero? zero-polynomial)
