(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))
