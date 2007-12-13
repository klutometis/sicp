;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "lazy-text-of-quotation.scm")

(define (install-lazy-quoted-package)
  (put 'quote lazy-text-of-quotation)
  'done)
