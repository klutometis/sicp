;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "raise.scm")
(load "install-scheme-number-package.scm")
(load "install-rational-package.scm")
(load "install-complex-package.scm")
(load "make-scheme-number.scm")
(load "apply-generic-multiple.scm")

(install-scheme-number-package)
(install-rational-package)
(install-complex-package)

(define number (make-scheme-number 2))
(define rational (raise number))
(define complex (raise rational))

(define numbers (list number rational complex))
(for-each (lambda (number) (write-line number)) numbers)
