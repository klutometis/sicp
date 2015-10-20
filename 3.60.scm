#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "add-streams.scm")
(include "mul-series.scm")
(include "trig-series.scm")

(test 1.0
      (apply
       +
       (stream->list
        (add-streams (mul-series sine-series sine-series)
                     (mul-series cosine-series cosine-series))
        10)))
