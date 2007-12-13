;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-deriv-package.scm")
(load "install-exponent-package.scm")
(load "deriv.scm")

(install-deriv-package)
(install-exponent-package)
(deriv '(** x 3) 'x)
