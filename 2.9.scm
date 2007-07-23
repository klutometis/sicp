(load "interval.scm")

;; Sum:
;; a1 + b1 = c1
;; a2 + b2 = c2
;; a2 - a1 + b2 - b1 = c2 - c1
;; (a2 - a1) / 2 + (b2 - b1) / 2 = (c2 - c1) / 2
;;
;; Difference:
;; a1 + (-|b1|) = c1
;; etc.

(define i (make-interval -2 5))
(define j (make-interval 3 7))
(define width-i (width-interval i))
(define width-j (width-interval j))
(equal? (+ width-i width-j) (width-interval (add-interval i j)))
(equal? (- width-i width-j) (width-interval (sub-interval i j)))
(equal? (* width-i width-j) (width-interval (mul-interval i j)))
(equal? (/ width-i width-j) (width-interval (mul-interval i j)))
