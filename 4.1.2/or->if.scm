;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "expand-or-clauses.scm")
(load "or-clauses.scm")

(define (or->if exp) (expand-or-clauses (or-clauses exp)))
