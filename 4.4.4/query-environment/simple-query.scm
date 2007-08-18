(define (simple-query query-pattern environment-stream)
  (stream-flatmap
   (lambda (environment)
     (stream-append-delayed
      (find-assertions query-pattern environment)
      (delay (apply-rules query-pattern environment))))
   environment-stream))
