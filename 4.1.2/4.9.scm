;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; Requires cdr to be quoted! Defect?
(define do-clause (eval-global '(let ((x '(1 3 5 7 9)))
                                  (do ((x x (quote (cdr x)))
                                       (sum 0 (+ sum (car x))))
                                      ((null? x) sum)))))

(test
 "do-clause"
 25
 do-clause
 '=
 =
 "http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Iteration.html#index-do-342")
