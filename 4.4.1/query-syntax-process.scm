(define (query-syntax-process exp)
  (map-over-symbols expand-question-mark exp))
