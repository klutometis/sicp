;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-rational.scm")
(load "type=?.scm")

(define (rational? x)
  (type=? x (make-rational 0 1)))

