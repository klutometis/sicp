#!/usr/bin/env chicken-scheme
(use extras test)

(define (rand message)
  (lambda (n)
    (case message
      ((generate) (random n))
      ((reset) (randomize n)))))

((rand 'reset) 100)
(test 1 ((rand 'generate) 6))
