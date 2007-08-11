(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))
