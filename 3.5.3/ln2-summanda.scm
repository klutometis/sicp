(define (ln2-summanda n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summanda (1+ n)))))
