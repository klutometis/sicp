(define (insert! keys value table)
  ((table 'insert-proc!) keys value))
