;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; See:
;; eval-unbind.scm
;; install-unbind-package.scm
;; make-unbound!.scm
;; unbind-variable!.scm

;; We decided to unbind the variable in the most proximate frame for
;; flexibility; an (utterly-unbind!) procedure would then be possible
;; by recursively unbinding up to the top frame.
(define unbind-test
  (eval-global '(let ((x 3))
                  (let ((x 2))
                    (unbind! x)
                    x))))

(test
 "unbind test"
 3
 unbind-test
 '=
 =)
