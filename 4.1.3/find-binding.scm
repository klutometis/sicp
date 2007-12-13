;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "the-empty-environment.scm")
(load "enclosing-environment.scm")
(load "empty-environment?.scm")
(load "first-frame.scm")
(load "make-binding.scm")

;; Returns a cons of value and frame
(define (find-binding variable env)
  (if (empty-environment? env)
      (make-binding variable #!default the-empty-environment)
        (let* ((frame (first-frame env))
               (value (hash-table/get frame variable #!default)))
          (if (default-object? value)
              (find-binding variable (enclosing-environment env))
              (make-binding variable value frame)))))
