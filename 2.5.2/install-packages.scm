(load "install-complex-package.scm")
(load "install-scheme-number-package.scm")
(load "install-rational-package.scm")

(define (install-packages)
  (install-complex-package)
  (install-scheme-number-package)
  (install-rational-package))
