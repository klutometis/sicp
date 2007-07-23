(load "install-complex-package.scm")
(load "make-complex-from-real-imag.scm")
(load "exp.scm")
(load "apply-generic-same-type.scm")

(install-complex-package)

(exp (make-complex-from-real-imag 1 1)
     (make-complex-from-real-imag 1 1))
