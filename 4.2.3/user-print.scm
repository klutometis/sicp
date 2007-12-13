;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "compound-procedure?.scm")
(load "procedure-parameters.scm")
(load "procedure-body.scm")
(load "get-print.scm")
(load "type-tag.scm")

(define (user-print object)
  (let ((print (get-print (type-tag object))))
    (if print
        (print object)
        (display object))))
