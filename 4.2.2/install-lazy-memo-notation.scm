;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "delay-it-memoized.scm")

(define (install-lazy-memo-notation)
  (put 'lazy-memo delay-it-memoized)
  'done)
