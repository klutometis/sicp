(define amb-qeval-map
  '(define (amb-qeval-map proc items)
     (if (null? items)
         '()
         (cons (proc (car items))
               (amb-qeval-map proc (cdr items))))))
