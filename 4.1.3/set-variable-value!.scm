;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "first-frame.scm")
(load "find-binding.scm")
(load "bind-variable!.scm")
(load "unbound-binding?.scm")
(load "binding-frame.scm")

(define (set-variable-value! var val env)
  (let* ((binding (find-binding var env))
         (frame (binding-frame binding)))
    (if (unbound-binding? binding)
        (error "Unbound variable -- SET!" var)
        (bind-variable! var val frame))))
