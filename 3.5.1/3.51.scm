(load "stream-map.scm")
(load "stream-enumerate-interval.scm")

(define (show x)
  (display-line x)
  x)

;; 10
;; 9
;; 8
;; .
;; .
;; .
;; 0
;; It forces its promises from innermost outward.
(define x (stream-map show (stream-enumerate-interval 0 10)))

;; 5
;; Regardless of outward/inwardness, prints the median.
(stream-ref x 5)

;; 7
;; Stops on the seventh promise; no outward unwrapping.
(stream-ref x 7)
