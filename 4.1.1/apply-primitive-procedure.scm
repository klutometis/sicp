;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "primitive-implementation.scm")

(define (apply-primitive-procedure proc args)
  ((make-primitive-procedure 'apply)
   (primitive-implementation proc) args))
