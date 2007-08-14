(define an-integer-starting-from
  '(define (an-integer-starting-from n)
     (amb n (an-integer-starting-from (+ n 1)))))
