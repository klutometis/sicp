(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (bind-variable! var val frame)))
