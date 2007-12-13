;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "sign-change-detector.scm")

(define (make-zero-crossings input-stream last-value last-last-value)
  (if (stream-null? input-stream)
      the-empty-stream
      (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
        (cons-stream (sign-change-detector last-last-value last-value)
                     (make-zero-crossings (stream-cdr input-stream)
                                          avpt last-value)))))
