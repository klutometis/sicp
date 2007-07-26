(load "add-streams.scm")
(load "mul-streams.scm")
(load "scale-stream.scm")

;; McIlroy, "Squinting at Power Series", 4.
(define (mul-series s1 s2)
  (let ((s1-0 (stream-car s1))
        (s2-0 (stream-car s2))
        (s1-1->k (stream-cdr s1))
        (s2-1->k (stream-cdr s2)))
    (cons-stream (* s1-0 s2-0)
                 (add-streams (scale-stream s1-1->k s2-0)
                              (add-streams (scale-stream s2-1->k s1-0)
                                           (mul-series s1-1->k s2-1->k))))))
