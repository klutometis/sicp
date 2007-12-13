;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "tagged-list?.scm")
(load "lazy-pair?.scm")

(define (compound-procedure? p)
  (or (tagged-list? p 'procedure)
      (lazy-pair? p)))
