(define (simple-flatten stream)
  (stream-map stream-car
   (stream-filter (lambda (frame) (not (stream-null? frame)))stream)))
