;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (find-pair pair pair-stream)
  (if (stream-null? pair-stream)
      #f
      (cons-stream
       (stream-car pair-stream)
       (if (equal? (stream-car pair-stream)
                   pair)
           the-empty-stream
           (find-pair pair (stream-cdr pair-stream))))))
