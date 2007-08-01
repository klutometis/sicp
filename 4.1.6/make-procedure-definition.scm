(define (make-procedure-definition definition-variable definition-value body)
  (cons 'define (cons (cons definition-variable definition-value) body)))
