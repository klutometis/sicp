;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "empty-environment?.scm")
(load "binding-value.scm")
(load "binding-frame.scm")

;; Oxymoron, we know.
(define (unbound-binding? binding)
  (let ((value (binding-value binding))
        (frame (binding-frame binding)))
    (and (default-object? value)
         (empty-environment? frame))))
