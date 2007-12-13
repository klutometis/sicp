;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; In unserialized reads, a user may access the balance between a
;; withdrawal or deposit's access and transaction (or even during the
;; transaction as it is writing memory); resulting in a spurious
;; figure.

;; Atomicity is not preserved over the read-write barrier, creating
;; disparaties between internal state and external representation.
