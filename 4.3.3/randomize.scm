;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Slower than in-place shuffling.
(define (randomize elements)
  (if (null? elements)
      '()
      (let* ((index (random (length elements)))
             (element (list-ref elements index)))
        (cons element
              (randomize (append (list-head elements index)
                                 (list-tail elements (1+ index))))))))
