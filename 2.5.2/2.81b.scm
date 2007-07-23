(load "install-scheme-number-package.scm")
(load "make-scheme-number.scm")
(load "exp.scm")
(load "remove-coercion!.scm")

(install-scheme-number-package)

(remove-coercion! 'scheme-number 'scheme-number)
(exp (make-scheme-number 2) (make-scheme-number 3))

;; T->T coercion unnecessary in the case where (get op '(T T)) resolves.
