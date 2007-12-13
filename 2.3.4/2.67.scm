;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "sample-tree.scm")
(load "sample-message.scm")
(load "decode.scm")

(decode sample-message sample-tree)
;; (a d a b b c a)
