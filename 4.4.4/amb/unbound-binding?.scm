;; Oxymoron, we know.
(define (unbound-binding? binding)
  (let ((value (binding-value-amb binding))
        (frame (binding-frame binding)))
    (and (default-object? value)
         (empty-environment? frame))))
