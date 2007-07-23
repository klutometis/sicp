(define (all-but-last-pair l)
  (if (null? (cdr l))
      '()
      (cons (car l) (all-but-last-pair (cdr l)))))

;;(all-but-last-pair '(1 2 3 4))
