;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

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

;; See 4.20.png; doesn't, however, show the effect of assignment over
;; time.
