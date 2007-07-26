(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
