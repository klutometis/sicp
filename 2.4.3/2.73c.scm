(load "install-deriv-package.scm")
(load "install-exponent-package.scm")
(load "deriv.scm")

(install-deriv-package)
(install-exponent-package)
(deriv '(** x 3) 'x)
