(load "install-deriv-package.scm")
(load "deriv.scm")

(install-deriv-package)
(deriv '(+ x x) 'x)
(deriv '(* x x) 'x)
