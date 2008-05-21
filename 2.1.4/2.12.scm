;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.1.4/section)
(import* section-2.1.4
         make-center-percent-interval
         percent-interval
         make-interval)

(let ((i (make-center-percent-interval 2 .5)))
  (check (percent-interval i) (=> approx?) 0.5)
  (check i => (make-interval 1.0 3.0)))
