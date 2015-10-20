#!/usr/bin/env chicken-scheme
(use numbers sicp-streams test)

(include "trig-series.scm")

(test '(1 0 -1/2 0 1/24) (stream->list cosine-series 5))
(test '(0 1 0 -1/6 0) (stream->list sine-series 5))
