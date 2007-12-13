;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "type>=?.scm")
(load "type=?.scm")

(define (type>? x1 x2)
  (and (not (type=? x1 x2))
       (type>=? x1 x2)))
