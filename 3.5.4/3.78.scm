;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "solve-2nd-linear.scm")

(define solution (stream-ref (solve-2nd-linear -1 -1 0.001 1 1) 1000))

(test
 "ad-hoc second-order solver"
 1.1936006420917238
 1.1936006420917238
 '=
 =)
