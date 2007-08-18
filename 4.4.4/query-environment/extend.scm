(define (extend variable value environment)
  (environment-define environment variable value)
  environment)

