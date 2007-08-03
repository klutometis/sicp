(load "tagged-list?.scm")
(load "lazy-pair?.scm")

(define (compound-procedure? p)
  (or (tagged-list? p 'procedure)
      (lazy-pair? p)))
