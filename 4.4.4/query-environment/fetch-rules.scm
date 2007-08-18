(define (fetch-rules pattern environment)
  (if (use-index? pattern)
      (get-indexed-rules pattern)
      (get-all-rules)))
