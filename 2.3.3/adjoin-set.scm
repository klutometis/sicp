;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "element-of-set.scm")

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))
