(define (if-test)
  (make-test
   '(if true 1)
   (lambda (value)
     (test
      "if test"
      '1
      value
      '= =))))
