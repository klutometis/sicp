(define (operation-exp? exp)
  (and (pair? exp) (tagged-list? (car exp) 'op)))
