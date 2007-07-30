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
