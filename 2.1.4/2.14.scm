;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(require '../util/util)
(import* util approx?)
(import* section-2.1.4
         make-center-percent-interval
         par1-interval
         par2-interval
         center-interval
         percent-interval)

(let ((i (make-center-percent-interval 5 .05))
      (j (make-center-percent-interval 3 .05)))
  (let ((x (par1-interval i j))
        (y (par2-interval i j)))
    (check (percent-interval x) (=> approx?) 0.1490)
    (check (center-interval x) (=> approx?) 1.8938)
    (check (percent-interval y) (=> approx?) 0.05)
    (check (center-interval y) (=> approx?) 1.875)))
