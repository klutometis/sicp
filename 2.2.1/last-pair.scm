(define (last-pair list)
  (cond ((null? list) '())
        ((null? (cdr list) ) list)
        (else (last-pair (cdr list)))))
