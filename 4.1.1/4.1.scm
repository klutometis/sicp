;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")

;; Result differs in left-to-right and right-to-left evaluation.
(define (distinguish-left-from-right)
  (define (distinguish exp)
    (eval-global '(define w 1))
    (eval-global '(define x 1))
    (eval-global '(define (f y z) (set! w (* z w)) (set! x (* z w)) (+ w x)))
    (eval-global exp))
  (map distinguish (list '(+ (f 1 0)) '(+ (f 0 1)))))

(load "list-of-values-right-to-left.scm")
(define right-to-left (distinguish-left-from-right))

(load "list-of-values-left-to-right.scm")
(define left-to-right (distinguish-left-from-right))

(test
 "right-to-left evaluation"
 '(2 0)
 right-to-left
 'equal?
 equal?)

(test
 "left-to-right evaluation"
 '(0 2)
 left-to-right
 'equal?
 equal?)
