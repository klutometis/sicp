#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.6][3\.6:1]]

(use extras test)

(define (rand message)
  (lambda (n)
    (case message
      ((generate) (random n))
      ((reset) (randomize n)))))

((rand 'reset) 100)
(test 1 ((rand 'generate) 6))

;; 3\.6:1 ends here
