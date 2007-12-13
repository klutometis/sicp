;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "force-it.scm")

(define (actual-value exp env)
  (force-it (eval exp env)))
