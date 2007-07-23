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
