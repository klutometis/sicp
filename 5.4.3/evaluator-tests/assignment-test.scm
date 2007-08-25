(define (assignment-test)
  (make-test
   '(begin (define x 2) (set! x 3) x)
   (lambda (value)
     (test
      "assignment test"
      '3
      value
      '= =))))
