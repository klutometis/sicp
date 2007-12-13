;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "first-frame.scm")
(load "bind-variable!.scm")

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (bind-variable! var val frame)))
