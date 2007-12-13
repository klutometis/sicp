;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "union-set-ordered.scm")
(load "union-set.scm")

(define set1 '(1 3 5 7))
(define set2 '(2 4 6 8))

(union-set set1 set2)

(equal? (union-set set1 set2)
        (union-set set2 set1))
