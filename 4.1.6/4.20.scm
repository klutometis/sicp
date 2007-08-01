(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define fact-10
  (eval-global '(letrec ((fact
                          (lambda (n)
                            (if (= n 1)
                                1
                                (* n (fact (- n 1)))))))
                  (fact 10))))

(test
 "letrec-factorial"
 3628800
 fact-10
 '=
 =)
