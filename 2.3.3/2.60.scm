;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "element-of-set.scm")
(load "union-set.scm")
(load "intersection-set.scm")

;; n = |set|, m = |list|; where n <= m

;; element-of-set: theta(m) vs. theta(n)

;; adjoin-set: theta(1) vs. theta(n)
(define (adjoin-set x set)
  (cons x set))

;; intersection-set: theta(m^2) vs. theta(n^2)

;; union-set: theta(m) vs. theta(n^2) (Since it's
;; based on constant adjoin-set above.)

(define set1 '(1 1 2 2 3 3))
(define set2 '(3 3 4 4 5 5))

(intersection-set set1 set2)
(union-set set1 set2)

;; Sets with duplicates used where set-adjoining and
;; union are important; say: real-time collection of
;; data to be analysed later.
