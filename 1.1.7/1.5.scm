(define (test x y)
  (if (= x 0)
      0
      y))

;; Forces normal order;
;; 0.
(define (p) (delay p))
(test 0 (p))

;; Applicative order (default);
;; never returns.
(define (p) (p))
(test 0 (p))
