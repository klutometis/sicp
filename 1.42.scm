#!/usr/bin/env chicken-scheme
(use test)

(include "compose.scm")

(test 49 ((compose square inc) 6))
