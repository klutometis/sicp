(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define let*-test (eval-global '(let* ((x 3) (y (+ x 2)) (z (+ x y 5))) (* x z))))

(test
 "let*-clause"
 39
 let*-test
 '=
 =)

;; It sufficeth to evaluate the outermost let*: or does it?
