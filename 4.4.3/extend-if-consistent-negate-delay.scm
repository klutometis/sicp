;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (extend-if-consistent var dat frame)
  (let ((binding (binding-in-frame var frame)))
    (if binding
        (pattern-match (binding-value binding) dat frame)
        (let* ((extension (extend var dat frame))
               (negate-bound (negate-bound extension)))
          (if (and negate-bound
                   (not (stream-null? (qeval negate-bound (singleton-stream extension)))))
              'failed
              extension)))))
