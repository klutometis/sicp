;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; (expmod base (/ exp 2) m) is calculated twice (as in normal order),
;; instead of being optimized-away by application (i.e. reduced to a constant).
