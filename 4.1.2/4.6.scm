(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define let-test (eval-global '(let ((x 1) (y 2)) (write-line x) y)))

(test
 "let clause"
 2
 let-test
 '=
 =)
