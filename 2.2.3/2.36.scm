;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "accumulate-n.scm")

(define seqs '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(accumulate-n + 0 seqs)
