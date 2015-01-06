#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.64][2\.64:1]]

(use test)
(include "tree-sets.scm")

(test '(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
      (list->tree '(1 3 5 7 9 11)))

;; 2\.64:1 ends here
