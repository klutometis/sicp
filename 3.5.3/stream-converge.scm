;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (stream-converge stream tolerance)
  (if (stream-null? stream)
      the-empty-stream
      (let ((current (stream-ref stream 0))
            (next (stream-ref stream 1)))
        (cons-stream
         current
         (if (< (abs (- current next)) tolerance)
             (cons-stream next the-empty-stream)
             (stream-converge (stream-cdr stream) tolerance))))))
