;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "deriv.scm")

(define (augend x)
  (if (> (length x) 3)
      (append (list '+) (cddr x))
      (caddr x)))

(define (multiplicand x)
  (if (> (length x) 3)
      (append (list '*) (cddr x))
      (caddr x)))

(deriv '(* x y (+ x 3)) 'x)
