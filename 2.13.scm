(load "interval.scm")
;; Two intervals i, j and their product p; where {i,j,p}_c denotes
;; center; {i,j,p}_{u,l} upper and lower bounds, respectively;
;; and {i,j,p}_{p} percentage expressed as width over center.
;; (i_c +- i_c * i_p) *
;; (j_c +- j_c * j_p) =
;; p_c +- p_c * p_p
;;
;; i_c * j_c +-
;; i_c * j_c * i_p +-
;; i_c * j_c * j_p +-
;; i_c * j_c * i_p * j_p =
;; p_c +- p_c * p_p
;;
;; As j_c and i_c get very small, i_c * j_c * i_p * j_p tends to nil;
;; i_c * j_c * i_p tends to i_p; i_c * j_c * j_p tends to j_p;
;; and i_c * j_c is p_c.  Therefore:
;;
;; i_p + j_p =~ p_c
;;
;; as i_p and j_p get small.
(define i (make-center-percent-interval 2 0.02))
(define j (make-center-percent-interval 2 0.03))
(percent-interval i)
(percent-interval j)
(percent-interval (mul-interval i j))
