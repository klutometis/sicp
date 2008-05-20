;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check (srfi 1 26))
(require '../util/util)
(import util)
(let-values (((time result)
              (timed-result (lambda () (iota 1000000)))))
  (check time (=> >) 0.0))
