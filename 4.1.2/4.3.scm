;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; self-evaluating
(define self-evaluating (eval-global '2))

;; definition
(eval-global '(define x 3))
(define definition (eval-global 'x))

;; application
(define application (eval-global '(+ 2 x)))

;; assignment
(eval-global '(set! x 4))
(define assignment (eval-global '(+ 2 4)))

;; if
(define if-clause (eval-global '(if true 1)))

;; cond
(define cond-clause (eval-global '(cond (false 0) (else 1))))

;; lambda
(define lambda-clause (eval-global '((lambda () 1))))

;; begin
(define begin-clause (eval-global '(if 1 (begin (set! x 4) x))))

(test 'self-evaluating 2 self-evaluating '= =)
(test 'definition 3 definition '= =)
(test 'application 5 application '= =)
(test 'assignment 6 assignment '= =)
(test 'if 1 if-clause '= =)
(test 'cond 1 cond-clause '= =)
(test 'lambda 1 lambda-clause '= =)
(test 'begin 4 begin-clause '= =)
