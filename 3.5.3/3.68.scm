(load "interleave.scm")
(load "integers.scm")

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

;; Never returns, since it attempts to build the whole row first.
;(stream-head (pairs integers integers) 10)
