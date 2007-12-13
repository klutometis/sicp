;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-complex-package.scm")
(load "install-scheme-number-package.scm")
(load "install-rational-package.scm")
(load "make-scheme-number.scm")
(load "make-rational.scm")
(load "make-complex-from-real-imag.scm")
(load "real-part.scm")
(load "add.scm")
(load "raise.scm")
(load "apply-generic-raise.scm")

(install-complex-package)
(install-scheme-number-package)
(install-rational-package)

(define number (make-scheme-number 2))
(define rational (raise number))
(define complex (raise rational))

;; Complex procedure on scheme-number
(display (real-part number))

;; Successive raising
(add number (add rational complex))
