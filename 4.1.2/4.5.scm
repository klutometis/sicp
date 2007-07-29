(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define extended-cond
  (eval-global '(cond (false 2) (1 => (lambda (x) (+ x 1))) (else 3))))

(test "extended cond" 2 extended-cond '= =)
