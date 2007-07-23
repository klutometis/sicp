;; (expmod base (/ exp 2) m) is calculated twice (as in normal order),
;; instead of being optimized-away by application (i.e. reduced to a constant).
