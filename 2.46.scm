#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.46][2\.46:1]]

(use test)
(include "vect.scm")

(test (make-vect 4 7)
      (add-vect (make-vect 1 2) (make-vect 3 5)))

(test (make-vect -2 -3)
      (sub-vect (make-vect 1 2) (make-vect 3 5)))

(test (make-vect 6 15)
      (scale-vect 3 (make-vect 2 5)))

;; 2\.46:1 ends here
