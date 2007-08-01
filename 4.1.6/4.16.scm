(load "eval-global.scm")
(load "install-packages.scm")
(load "scan-out-definitions.scm")
(load "make-definition.scm")
(load "make-procedure-definition.scm")

(install-packages)

(define internal-def (eval-global '((lambda (x) (define w 3) (define (y z) (+ x z)) (y 3)) 2))

(test
 "internal definitions"
 5
 internal-def
 '=
 =)

;; We placed scan-out-defines in procedure-body, being fans of
;; just-in-time-evaluation; it allows maximum flexibility of
;; expression-transformation, should derived expressions preëmpt the
;; scan-out-definitions.
