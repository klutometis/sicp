;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "analyze.scm")

(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))
