;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (tolerant= x y tolerance)
  (= (round (/ x tolerance))
     (round (/ y tolerance))))
