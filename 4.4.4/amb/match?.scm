(load-option 'format)
(load-option 'regular-expression)

(define (match? pattern result)
  (not (false? (re-string-match pattern (format #f "~A" result)))))
