(define (assertion-to-be-added? exp)
  (eq? (type exp) 'assert!))
