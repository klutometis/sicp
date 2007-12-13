;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "text-of-quotation.scm")

(define (install-quoted-package)
  (put 'quote (lambda (exp env) (text-of-quotation exp)))
  'done)
