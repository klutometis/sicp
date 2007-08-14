(define (eval-global exp)
  (eval exp the-global-environment))
