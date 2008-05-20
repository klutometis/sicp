;;; Equal to 4 decimal places.
(define (approx? x y)
  (approx-n? x y 5))

(define (approx-n? x y n)
  (let* ((precision (expt 10 n))
         (precise (lambda (x) (exact-round (* x precision)))))
    (= (precise x) (precise y))))
