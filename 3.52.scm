#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.52][3\.52:1]]

(use sicp-streams test)

(define sum 0)

(define (accum x) (set! sum (+ x sum)) sum)

(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))

(test 1 sum)

(define y (stream-filter even? seq))

(test 6 sum)

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))

(test 10 sum)

(stream-ref y 7)

(test 136 sum)

(display-stream z)

(test 210 sum)

;; 3\.52:1 ends here
