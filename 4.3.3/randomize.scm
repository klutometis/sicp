;; Slower than in-place shuffling.
(define (randomize elements)
  (if (null? elements)
      '()
      (let* ((index (random (length elements)))
             (element (list-ref elements index)))
        (cons element
              (randomize (append (list-head elements index)
                                 (list-tail elements (1+ index))))))))
