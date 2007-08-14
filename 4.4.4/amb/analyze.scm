(define (analyze exp)
  ((get-amb (type-tag exp)) exp))
