(load "install-application-package.scm")
(load "install-assignment-package.scm")
(load "install-begin-package.scm")
(load "install-cond-package.scm")
(load "install-definition-package.scm")
(load "install-if-package.scm")
(load "install-lambda-package.scm")
(load "install-quoted-package.scm")
(load "install-self-evaluating-package.scm")
(load "install-variable-package.scm")
(load "install-and-package.scm")
(load "install-or-package.scm")
(load "install-let-package.scm")
(load "install-let*-package.scm")
(load "install-do-package.scm")
(load "install-unbind-package.scm")
(load "install-letrec-package.scm")
(load "install-amb-package.scm")
(load "install-xor-package.scm")

(define (install-packages)
  (install-application-package)
  (install-assignment-package)
  (install-begin-package)
  (install-cond-package)
  (install-definition-package)
  (install-if-package)
  (install-lambda-package)
  (install-quoted-package)
  (install-self-evaluating-package)
  (install-variable-package)
  (install-and-package)
  (install-or-package)
  (install-let-package)
  (install-let*-package)
  (install-do-package)
  (install-unbind-package)
  (install-letrec-package)
  (install-amb-package)
  (install-xor-package))
