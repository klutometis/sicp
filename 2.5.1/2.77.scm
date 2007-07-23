(load "install-complex-package.scm")
(load "make-complex-from-real-imag.scm")
(load "magnitude.scm")

(install-complex-package)
(define imag (make-complex-from-real-imag 3 4))
(trace apply-generic)
(magnitude imag)
;; It works because the complex part reinvokes the generic function,
;; while apply-generic has stripped the first tag; invoking magnitude
;; with the {rectangular, polar} tag.
