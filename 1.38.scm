#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.38][1\.38:1]]

(use test)

(include "cont-frac.scm")

(define e 2.71828182846)

(test (- e 2)
      (cont-frac (lambda (i) 1.0)
                 (lambda (i) (if (zero? (modulo (+ i 2) 3))
                            (+ 2 (floor (* 2 (/ i 3))))
                            1.0))
                 7))

;; 1\.38:1 ends here
