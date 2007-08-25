(define (and-test)
  (make-test
   '(and true true (and false 1))
   (lambda (value)
     (test
      "and test"
      '#f
      value
      'eq? eq?))))
