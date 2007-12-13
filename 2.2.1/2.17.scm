;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "last-pair.scm")

(define last-pair (last-pair '(1 2 3 4)))

(test
 "last pair"
 '(4)
 last-pair
 'equal? equal?)
