;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "find-binding.scm")
(load "first-frame.scm")
(load "unbound-binding?.scm")
(load "binding-frame.scm")
(load "binding-value.scm")
(load "unassigned?.scm")

(define (lookup-variable-value var env)
  (let* ((binding (find-binding var env))
         (value (binding-value binding))
         (frame (binding-frame binding)))
    (if (unbound-binding? binding)
        (error "Unbound variable -- LOOKUP" var)
        (if (unassigned? value)
            (error "Bound but nought yet assignèd, padawan -- LOOKUP" var)
            value))))
