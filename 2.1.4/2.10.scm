;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "interval.scm")

(define (div-interval x y)
  (let ((upper-bound-y (upper-bound y))
        (lower-bound-y (lower-bound y)))
    (if (or (zero? upper-bound-y) (zero? lower-bound-y))
        (error "Thou dividest by zeno [sic], Freund.")
        (let ((divisor (make-interval (/ 1.0 (upper-bound-y))
                                      (/ 1.0 (lower-bound-y)))))
          (mul-interval x divisor)))))

(define i (make-interval -2 5))
(define j (make-interval -1 0))
(div-interval i j)
