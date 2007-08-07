(define (stream-flatmap proc s)
  (flatten-stream (stream-map proc s)))
