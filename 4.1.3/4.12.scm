(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

;; See:
;; binding-frame.scm
;; binding-value.scm
;; binding-variable.scm
;; find-binding.scm
;; make-binding.scm
;; unbound-binding?.scm
;; lookup-variable-value.scm
;; set-variable-value!.scm
;; define-variable!.scm

(install-packages)

(eval-global '(define x 3))
(define define-test (eval-global 'x))

(test
 "new abstract lookup-procedures"
 3
 define-test
 '=
 =)
