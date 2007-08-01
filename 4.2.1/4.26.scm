;; Using delay and force, it's possible to implement unless within
;; applicative order (see 4.25); on the other hand, special forms are
;; not first-class (and cannot be passed like normal procedures).

;; One could imagine a logic language in which conjuctives and
;; disjunctive (and, or, unless) were passed around as operators.
