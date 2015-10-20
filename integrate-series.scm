#!/usr/bin/env chicken-scheme
(include "stream-map.scm")

(define (integrate-series coefficients)
  (stream-map (lambda (integral coefficient)
                (* (/ 1 integral) coefficient))
              integers
              coefficients))
