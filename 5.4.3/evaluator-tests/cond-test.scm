(define (cond-test)
  (make-test
   '(cond (false 0) (else 1))
   (lambda (value)
     (test
      "cond test"
      '1
      value
      '= =))))
