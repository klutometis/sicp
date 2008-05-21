;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check (srfi 1 26))
(require '../util/util)
(import util)

(let-values (((time result)
              (timed-result (lambda () (iota 1000000)))))
  (check time (=> >) 0.0))

(check (terminate? (lambda () #t)) => #t)
(check (terminate? (lambda () ((lambda (x) (x x)) (lambda (x) (x x)))))
       => #f)

(check (approx? 1.6181 1.61814) => #t)
(check (approx? 1.6181 1.61815) => #f)

(check (range? 2.9 -1 1 (sqrt 10)) => #t)
