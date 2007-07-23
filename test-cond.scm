(define d -9)

;; Cond doesn't implicitly fall-through
(cond ((< d 0) (display "uoenthoeunth"))
      ((< d -1) (display "234978234789"))
      (else (display "q;jmwvkjqmwv")))

(let ((cond ((< d 0) (define e 1))
            ((< d -1) (define e 2))
            (else (define e 3))))
  (display e))

