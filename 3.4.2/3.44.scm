;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; The difficulty with exchange happened at the diffirence step:
;; subtracting one account's balance from the other was not
;; synchronized with deposit and withdrawal, resulting in
;; irregularities.

;; With transfer, however, there is no anatomic middle step; and
;; balance is automatically preserved.
