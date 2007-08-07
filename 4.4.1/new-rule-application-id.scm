(define (new-rule-application-id)
  (set! rule-counter (+ 1 rule-counter))
  rule-counter)
