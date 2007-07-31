;; Let H(P, I) be that P halts on input I, and K(P) <-> ~H(P, P).

;; K(K) <-> ~H(K, K); but K -> ~H(K, K) -> ~K(K) and
;; ~K -> H(K, K) -> K(K), which violates H's contract.
