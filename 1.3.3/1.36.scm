;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.3/section)
(require '../util/util)
(import* util average approx-n?)
(import* section-1.3.3 fixed-point)

(check
 (fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)
 (=> (lambda (x y) (approx-n? x y 4)))
 (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10.0))
;; 32 vs. 9 steps; 400%.
