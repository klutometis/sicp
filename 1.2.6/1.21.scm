;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.2.6/section)
(import* section-1.2.6 smallest-divisor)

(check
 (list (smallest-divisor 199)
       (smallest-divisor 1999)
       (smallest-divisor 19999)) => '(199 1999 7))
