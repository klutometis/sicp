(load "make-scheme-number.scm")
(load "make-from-real-imag.scm")
(load "install-packages.scm")
(load "add.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define number (make-scheme-number 1))
(define rational (raise number))
(define complex (raise rational))
(define irreducible-complex (make-from-real-imag 1 1))

(define operata (list (add number complex)
                      (add number irreducible-complex)))

(for-each (lambda (operatum) (write-line operatum)) operata)
