#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.59][3\.59:1]]

(include "stream-map.scm")
(include "integers.scm")

(define (integrate-series coefficients)
  (stream-map (lambda (integral coefficient)
                (* (/ 1 integral) coefficient))
              integers
              coefficients))

;; 3\.59:1 ends here
