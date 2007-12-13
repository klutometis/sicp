;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "ln2-summanda.scm")
(load "partial-sums.scm")

(define ln2-stream
  (partial-sums (ln2-summanda 1)))
