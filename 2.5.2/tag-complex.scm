;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "attach-tag.scm")

(define (tag-complex x)
  (attach-tag 'complex x))
