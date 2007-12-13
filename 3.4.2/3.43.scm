;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Through composition of serializers, any two accounts are locked in
;; mutual read-write access; impervious to third-party interference
;; (in accordance with the mutex-contract).

;; Since exchange is commutative and conservative, dollar amount are
;; preserved across transactions; what results is some permutation of
;; the original set.

;; See 3.43a.png.

;; Sum of balances will be preserved, since reading and transacting
;; are atomic: fixed deltas are transmitted through time; otherwise,
;; the reading of a balance which mutated between said reading and
;; subtraction can result in loss and creation of money.

;; See 3.43b.png.
