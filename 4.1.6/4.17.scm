;; The extraneous frame owes to the stacked lambda to which let
;; decomposes.  A correct program will have not attempt to evaluate
;; internal definitions before the are define, anyway.  Define the
;; lambdas directly in the parent frame without recourse to let to
;; implement simultaneous scope.

;; See 4.17.png.

