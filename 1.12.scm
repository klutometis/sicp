;; Actually: we just want an individual element, e.g.: (0, 0), (2, 1).
(define (pascal n k)
  (cond ((zero? k) 1)
        ((= n k) 1)
        (else (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))

(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)
