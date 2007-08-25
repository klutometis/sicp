(define (make-test evaluanda testandum)
  (lambda (receive)
    (receive evaluanda testandum)))
