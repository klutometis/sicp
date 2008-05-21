;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case
                   check)
(require '../1.3.3/section)
(require '../util/util)
(import* util approx? phi)
(import* section-1.3.3 fixed-point)

;; phi^2 = phi + 1; phi -> 1 + 1 / phi

(check (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
       (=> approx?) phi)
