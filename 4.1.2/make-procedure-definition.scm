(define (make-procedure-definition definition-variable definition-value)
  (list 'define (cons definition-variable definition-value)))
