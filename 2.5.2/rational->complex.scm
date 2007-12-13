;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")
(load "apply-generic.scm")

(define (rational->complex r)
  (apply-generic 'rational->complex r))
