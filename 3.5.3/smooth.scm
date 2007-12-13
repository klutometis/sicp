;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "average.scm")

;; Perforce: loose the first and last point (unless fabricate
;; artificial ones).
(define (smooth stream)
  (if (stream-null? (stream-cdr stream))
      the-empty-stream
      (let ((current (stream-car (stream-cdr stream)))
            (last (stream-car stream)))
        (cons-stream (average current last)
                     (smooth (stream-cdr stream))))))
