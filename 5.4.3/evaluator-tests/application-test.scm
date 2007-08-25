(define (application-test)
  (make-test
   '(begin (define x 2) (+ x x))
   (lambda (value)
     (test
      "application test"
      '4
      value
      '= =))))
