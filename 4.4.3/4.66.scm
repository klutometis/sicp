;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; The accumulation scheme would produce spurious results in those
;; cases with redundant frames; one could implement a special form
;; "unique" which prunes the redundant frames, and accumulate
;; thereupon.  (Are there deductive difficulties, such as cases where
;; non-uniqueness is desirable?)

;; Unique can also be implemented without a special form, but with
;; recourse to an egregious state-hack (see the solution to 4.60).
