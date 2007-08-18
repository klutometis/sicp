(define (rule-body rule)
  (if (null? (cddr rule))
      '(always-true)
      (caddr rule)))
