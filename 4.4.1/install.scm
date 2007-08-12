(define (install query-lists)
  (map
   (lambda (queries) (map query queries))
   query-lists))
