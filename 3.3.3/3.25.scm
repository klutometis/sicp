;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-table-keys.scm")
(load "lookup-keys.scm")
(load "insert!-keys.scm")

(define table (make-table equal?))
(insert! '(a b c) 1 table)
(lookup '(a b c) table)

(insert! '(a b c d) 2 table)
(lookup '(a b c d) table)

(insert! '(a b c) 3 table)
(lookup '(a b c) table)

(insert! '(a b d e) 4 table)
(lookup '(a b d e) table)
