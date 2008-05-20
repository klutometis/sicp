;;; Equal to 4 decimal places.
(define (approx? x y)
  (let* ((precision 10000)
         (precise (lambda (x) (exact-round (* x precision)))))
    (= (precise x) (precise y))))
