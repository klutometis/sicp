;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "cont-frac.scm")

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

(load "test-cont-frac.scm")

(test-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 0.00001)
