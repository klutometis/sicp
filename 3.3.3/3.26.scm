;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; As long as the keys are comparable and ordered in a binary tree
;; (i.e. not merely consed together); the keys can be retrieved in
;; Theta(log n)-time, as opposed to Theta(n)-time, as the records grow
;; to n.

;; insert! and lookup would abstract away the tree-construction and
;; record-retrieval to specialized mutators and accessors for trees.
