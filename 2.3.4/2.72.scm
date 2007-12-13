;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; In the 2.71 case, at each juncture i = [0, n - 1]; encode-symbol
;; searches n - i possibilities in Theta(n) time:

;; Theta(sigma_i=1^n i) ~= Theta(n).
