;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "type>?.scm")

(define (type<? x1 x2)
  (not (type>? x1 x2)))
