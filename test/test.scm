(load-option 'format)

(define (test name expected-value given-value equal?)
  (define (report rubric value)
    (format #t "~A: ~A~%" rubric value))
  (report 'test-name name)
  (report 'expected-value expected-value)
  (report 'given-value given-value)
  (report 'equal? (equal? expected-value given-value)))

