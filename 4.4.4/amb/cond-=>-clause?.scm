(define (cond-=>-clause? clause)
  (and (= 3 (length clause))
       (eq? '=> (cadr clause))))
