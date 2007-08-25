(define (let-test)
  (make-test
   '(let ((x 1) (y 2)) (+ x y))
   (lambda (value)
     (test
      "let clause"
      3
      value
      '= =))))
