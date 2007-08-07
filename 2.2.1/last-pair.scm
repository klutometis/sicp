(define (last-pair list)
  (if (pair? list)
      (if (null? (cdr list))
          list
          (last-pair (cdr list)))
      (error "Not a pair -- LAST-PAIR")))
