;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define let*-test (eval-global '(let* ((x 3) (y (+ x 2)) (z (+ x y 5))) (write-line x) (* x z))))

(test
 "let*-clause"
 39
 let*-test
 '=
 =)

;; It sufficeth to evaluate the outermost let*: or does it?
