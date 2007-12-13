;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "install-packages.scm")
(load "make-polynomial.scm")
(load "make-rational.scm")
(load "add.scm")
(load "reduce.scm")
(load "numer.scm")
(load "apply-generic-raise.scm")

(install-packages)
(define p1 (make-polynomial 'x '((1 1) (0 1))))
(define p2 (make-polynomial 'x '((3 1) (0 -1))))
(define p3 (make-polynomial 'x '((1 1))))
(define p4 (make-polynomial 'x '((2 1) (0 -1))))

(define rf1 (make-rational p1 p2))
(define rf2 (make-rational p3 p4))

(add rf1 rf2)

;; (rational (polynomial sparse x (3 -1) (2 -2) (1 -3) (0 -1))
;;           (polynomial sparse x (4 -1) (3 -1) (1 1) (0 1)))
;;           
;; Opposite in sign from maxima, which gives:
;; 
;;                                3      2
;;                               x  + 2 x  + 3 x + 1
;; (%o9)/R/                      -------------------
;;                                  4    3
;;                                 x  + x  - x - 1
