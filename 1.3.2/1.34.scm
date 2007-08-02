(define (f g)
  (g 2))

;; (f square)

;; Due to applicative order, evaluates f to 2; attempts to run it.
;; In normal order, might fall into an endless loop.
(f f)
