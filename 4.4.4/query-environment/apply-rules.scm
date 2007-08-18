(define (apply-rules pattern environment)
  (stream-flatmap (lambda (rule)
                    (apply-a-rule rule pattern environment))
                  (fetch-rules pattern environment)))
