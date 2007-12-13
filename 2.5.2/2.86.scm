;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "make-complex-from-real-imag.scm")
(load "make-rational.scm")
(load "apply-generic-raise.scm")

(install-packages)

;; We had to generalize addition, subtraction, equality, etc.
(define complex
  (make-complex-from-real-imag (make-rational 1 2)
                               (make-rational 4 4)))

(add complex complex)
