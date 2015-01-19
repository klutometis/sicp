#!/usr/bin/env chicken-scheme

(use test)
(include "tree-sets.scm")

(test '(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
      (list->tree '(1 3 5 7 9 11)))
