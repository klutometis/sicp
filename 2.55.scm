;; ''abracadabra is equivalent to (quote (quote abracadabra)),
;; which reduces to (quote abracadabra) (the first `quote' is
;; quoted).  Therefore (car ''abracadabra) returns the second
;; quoted `quote' as the first element of the compound object.
(car ''abracadabra)
