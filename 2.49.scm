#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.49][2\.49:1]]

(use sicp)
(include "painters.scm")

(write-painter-to-svg (segments->painter outline) "2.49-outline.svg")
(write-painter-to-svg (segments->painter x) "2.49-x.svg")
(write-painter-to-svg (segments->painter diamond) "2.49-diamond.svg")
(write-painter-to-svg (segments->painter wave) "2.49-wave.svg")

;; 2\.49:1 ends here
