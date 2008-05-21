;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-center-percent-interval
         percent-interval
         center-interval
         mul-interval)

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
(let ((i (make-center-percent-interval 2 0.02))
      (j (make-center-percent-interval 2 0.03)))
 (check (percent-interval (mul-interval i j))
        (=> approx?) 0.05))
