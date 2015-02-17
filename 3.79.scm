#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "add-streams.scm")
(include "integral.scm")

(define (solve-2nd f dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (stream-map f dy y))
  y)

(test
 -47.2046483923628
 (stream-ref (solve-2nd - 0.001 1 1) 10000))
