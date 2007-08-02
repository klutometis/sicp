(define (up-split painter n)
  (if (zero? n)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
