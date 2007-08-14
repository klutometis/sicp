;; Returns a cons of value and frame
(define (find-binding variable env)
  (if (empty-environment? env)
      (make-binding-amb variable #!default the-empty-environment)
        (let* ((frame (first-frame env))
               (value (hash-table/get frame variable #!default)))
          (if (default-object? value)
              (find-binding variable (enclosing-environment env))
              (make-binding-amb variable value frame)))))
