(load "sign-change-detector.scm")

(define (make-zero-crossings-smooth sense-data smoother)
  (let ((smoothed-data (smoother sense-data)))
    (stream-map sign-change-detector
                smoothed-data
                (stream-cdr smoothed-data))))
