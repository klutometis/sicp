;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-scheme-number-package.scm")
(load "install-complex-package.scm")
(load "make-complex-from-real-imag.scm")
(load "make-scheme-number.scm")
(load "exp.scm")
(load "apply-generic-multiple.scm")

(install-complex-package)
(install-scheme-number-package)

(exp (make-complex-from-real-imag 2 0)
     (make-scheme-number 3))

;; If, for instance, there exists (op t2 t3) and one plies an
;; non-existent (op t1 t3) but there exists a coercion t1->t2; (op t2
;; t3) will not be found.

;; Also, unary operations on subclasses (real-part on a scheme-number,
;; say); won't work.
