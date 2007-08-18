(define (check-an-assertion assertion query-pat query-environment)
  (let ((match-result
         (pattern-match query-pat assertion query-environment)))
    (if (eq? match-result 'failed)
        the-empty-stream
        (singleton-stream match-result))))
