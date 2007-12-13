;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-frame variables values)
  (let ((frame (make-eq-hash-table)))
    (for-each (lambda (var val) (hash-table/put! frame var val))
              variables values)
    frame))
