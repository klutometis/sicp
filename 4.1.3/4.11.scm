;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

;; See:
;; make-frame.scm
;; frame-variables.scm
;; frame-values.scm
;; add-binding-to-frame!.scm

(install-packages)

(eval-global '(define x 3))
(define define-test (eval-global 'x))

(test
 "primitive test of new environment"
 3
 define-test
 '=
 =)
