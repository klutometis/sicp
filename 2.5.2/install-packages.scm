;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-complex-package.scm")
(load "install-scheme-number-package.scm")
(load "install-rational-package.scm")

(define (install-packages)
  (install-complex-package)
  (install-scheme-number-package)
  (install-rational-package))
