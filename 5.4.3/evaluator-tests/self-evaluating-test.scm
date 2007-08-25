(define (self-evaluating-test)
  (make-test
   '2
   (lambda (value)
     (test
      "self-evaluating test"
      '2
      value
      '= =))))
