(define (fetch-assertions pattern environment)
  (if (use-index? pattern)
      (get-indexed-assertions pattern)
      (get-all-assertions)))
