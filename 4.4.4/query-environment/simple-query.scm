;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (simple-query query-pattern environment-stream)
  (stream-flatmap
   (lambda (environment)
     (stream-append-delayed
      (find-assertions query-pattern environment)
      (delay (apply-rules query-pattern environment))))
   environment-stream))
