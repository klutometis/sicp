(define (negate-bound frame)
  (let ((association (assq 'negate-bound frame)))
    (if association
        (cadr association)
        association)))
