;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (simple-flatten stream)
  (stream-map stream-car
   (stream-filter (lambda (frame) (not (stream-null? frame)))stream)))
