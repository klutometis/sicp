(define amb-qeval-var?
  '(define (amb-qeval-var? pattern)
     (amb-qeval-tagged-list? pattern '?)))
