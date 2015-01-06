#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.1][3\.1:1]]

(use test)

(define (make-accumulator accumulatum)
  (lambda (accumulandum)
    (set! accumulatum (+ accumulandum accumulatum))
    accumulatum))

(let ((accumulator (make-accumulator 5)))
  (test 10 (accumulator 5))
  (test 15 (accumulator 5)))

;; 3\.1:1 ends here
