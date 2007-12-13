;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "mystery.scm")

(define v (list 'a 'b 'c 'd))
(define w (mystery v))

(write-line w)
(write-line v)

;; See 3.14.png.
