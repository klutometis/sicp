;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "div.scm")
(load "make-sparse-polynomial.scm")
(load "make-term.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define dividend
  (make-sparse-polynomial 'x (list (make-term 5 1)
                                   (make-term 0 -1))))

(define divisor
  (make-sparse-polynomial 'x (list (make-term 2 1)
                                   (make-term 0 -1))))

(div dividend divisor)
                  
