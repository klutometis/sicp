#!/usr/bin/env chicken-scheme

(use debug sicp-streams test)

(include "add-streams.scm")
(include "integral.scm")

(define (solve-2nd a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (add-streams (scale-stream dy a)
                           (scale-stream y b)))
  y)

(test
 0.00316658406372682
 (stream-ref (solve-2nd -1 -1 0.001 1 1) 10000))
