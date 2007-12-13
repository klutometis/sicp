;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-cycle.scm")

(define z (make-cycle (list 'a 'b 'c)))
;; (last-pair z) loops endlessly; see 3.13.png.

