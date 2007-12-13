;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "sign-change-detector.scm")

(define (make-zero-crossings-smooth sense-data smoother)
  (let ((smoothed-data (smoother sense-data)))
    (stream-map sign-change-detector
                smoothed-data
                (stream-cdr smoothed-data))))
