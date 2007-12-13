;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; The extraneous frame owes to the stacked lambda to which let
;; decomposes.  A correct program will have not attempt to evaluate
;; internal definitions before the are define, anyway.  Define the
;; lambdas directly in the parent frame without recourse to let to
;; implement simultaneous scope.

;; See 4.17.png.

