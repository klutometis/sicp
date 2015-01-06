#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.64][3\.64:1]]

(define (stream-limit stream tolerance)
  (let iter ((car (stream-car stream))
             (cdr (stream-cdr stream))
             (iterations 0))
    (let ((cadr (stream-car cdr)))
      (if (< (abs (- cadr car)) tolerance)
          (values cadr iterations)
          (iter cadr (stream-cdr cdr) (+ iterations 1))))))

;; 3\.64:1 ends here
