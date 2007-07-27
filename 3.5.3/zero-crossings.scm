(load "sign-change-detector.scm")

(define (zero-crossings sense-data)
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))
