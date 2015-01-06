#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.7][2\.7:1]]

(use test)

(include "interval.scm")

(test '(3 . 3)
      (add-interval (make-interval 1 1)
                    (make-interval 2 2)))

;; 2\.7:1 ends here
