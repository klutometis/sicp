;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "type-tag.scm")
(load "get.scm")

(define (eval exp env)
  ((get (type-tag exp)) exp env))
