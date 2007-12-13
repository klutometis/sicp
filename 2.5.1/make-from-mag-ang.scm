;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))
