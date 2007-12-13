;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define primitive-let (eval-global '(let ((x (lambda () 3))) (x))))

(test
 "primitive let with analysis"
 3
 primitive-let
 '=
 =)
