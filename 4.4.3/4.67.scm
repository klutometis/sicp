;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Before the system unifies a pattern with a frame, it should search
;; the history of pattern-frame pairs and abandon the query if it's
;; found there; the history should be modified after the decision to
;; apply is made.
