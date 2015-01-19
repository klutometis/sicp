#!/usr/bin/env chicken-scheme

(use sicp-streams test)

(include "invert-unit-series.scm")
(include "mul-series.scm")
(include "trig-series.scm")

(test 1.0
      (apply +
             (stream->list (mul-series cosine-series
                                       (invert-unit-series cosine-series))
                           5)))
