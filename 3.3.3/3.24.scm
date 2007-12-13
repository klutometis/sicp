;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-table.scm")
(load "lookup.scm")
(load "insert!.scm")

(define table (make-table equal?))
(insert! 'a 'b 1 table)
(lookup 'a 'b table)
