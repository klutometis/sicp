(define (definition-test)
  (make-test
   '(begin (define x 3) x)
   (lambda (value)
     (test
      "definition test"
      '3
      value
      '= =))))
