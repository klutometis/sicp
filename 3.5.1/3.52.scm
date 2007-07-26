(load "stream-map.scm")
(load "stream-filter.scm")
(load "stream-ref.scm")
(load "display-stream.scm")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))

(stream-ref y 7)

(display-stream z)

;; If delay had been implemented without memo-proc, sum would have
;; accumulated itself after every invocation of seq; thus 210, 420,
;; etc.
