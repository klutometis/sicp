#!/usr/bin/env chicken-scheme
(use test)

(include "fold.scm")

(test (/ 3 2) (fold-right / 1 (list 1 2 3)))
(test (/ 1 6) (fold-left / 1 (list 1 2 3)))
(test '(1 (2 (3 ()))) (fold-right list nil (list 1 2 3)))
(test '(((() 1) 2) 3) (fold-left list nil (list 1 2 3)))
