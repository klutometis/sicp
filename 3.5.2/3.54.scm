;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "integers-starting-from.scm")
(load "mul-streams.scm")
(load "display-stream-n.scm")

(define factorials
  (cons-stream 1 (mul-streams factorials (integers-starting-from 2))))

(define n-factorials (stream-head factorials 10))

(test
 "factorials by mul-stream"
 '(1 2 6 24 120 720 5040 40320 362880 3628800)
 n-factorials
 'equal?
 equal?)
