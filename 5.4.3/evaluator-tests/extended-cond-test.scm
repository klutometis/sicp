(define (extended-cond-test)
  (make-test
   '(cond ((assoc 'b '((a 1) (b 2))) => cadr)
          (else false))
   (lambda (value)
     (test
      "extended cond"
      2
      value
      '= =))))
