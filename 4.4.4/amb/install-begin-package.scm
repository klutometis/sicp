;; NOTA BENE: does not take advantage of analysis!
(define (install-begin-package)
  (define (analyze-begin exp)
    (lambda (env) (eval-sequence (begin-actions exp) env)))
  (put-amb 'begin analyze-begin)
  'done)
