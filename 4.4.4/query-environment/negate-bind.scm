(define (negate-bind negated-query frame)
  (cons `(negate-bound ,negated-query) frame))
