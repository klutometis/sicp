(define (make-new-variable var rule-application-id)
  (cons '? (cons rule-application-id (cdr var))))
