;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-from-mag-ang.scm")
(load "apply-generic.scm")

(define number (make-from-mag-ang 1 45))
(apply-generic 'magnitude number)
(apply-generic 'angle number)
(apply-generic 'real-part number)
(apply-generic 'imag-part number)
