;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension
 syntax-case
 check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-interval
         width-interval
         add-interval
         sub-interval
         mul-interval
         div-interval
         upper-bound
         lower-bound
         interval=?)

;; Sum:
;; a1 + b1 = c1
;; a2 + b2 = c2
;; a2 - a1 + b2 - b1 = c2 - c1
;; (a2 - a1) / 2 + (b2 - b1) / 2 = (c2 - c1) / 2
;;
;; Difference:
;; a1 + (-|b1|) = c1
;; etc.

(let ((i (make-interval -2 5))
      (j (make-interval 3 7)))
  (let ((sum (add-interval i j)))
    (check sum (=> interval=?) (make-interval 1 12)))
  (let ((difference (sub-interval i j)))
    (check difference (=> interval=?) (make-interval -5 -2)))
  (let ((product (mul-interval i j)))
    (check product (=> interval=?) (make-interval -14 35)))
  ;; fails
  (let ((quotient (div-interval i j)))
    (check quotient (=> interval=?) (make-interval (/ -2 3) (/ 5 3)))))
