(define (or-test)
  (make-test
   '(or false false (or false true))
   (lambda (value)
     (test
      "or test"
      '#t
      value
      'eq? eq?))))
