(define an-element-of
  '(define (an-element-of items)
     (require (not (null? items)))
     (amb (car items) (an-element-of (cdr items)))))
