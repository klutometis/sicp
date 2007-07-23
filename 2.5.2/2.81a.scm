(load "install-complex-package.scm")
(load "make-complex-from-real-imag.scm")
(load "exp.scm")

(install-complex-package)

(exp (make-complex-from-real-imag 1 1)
     (make-complex-from-real-imag 1 1))

;; (apply-generic op . '(complex complex)) loops endlessly because
;; t1->t2 = t2->t1; there is no resolution.
