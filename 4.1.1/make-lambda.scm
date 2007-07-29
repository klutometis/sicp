(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))
