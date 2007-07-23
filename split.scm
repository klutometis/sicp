(define (split op1 op2)
  (define (split-iter painter n)
    (if (zero? n)
        painter
        (let ((smaller (split-iter painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  ;; Curried?
  (lambda (painter n) (split-iter painter n)))
