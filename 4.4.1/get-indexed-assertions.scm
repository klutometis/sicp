(define (get-indexed-assertions pattern)
  (get-stream (index-key-of pattern) 'assertion-stream))
