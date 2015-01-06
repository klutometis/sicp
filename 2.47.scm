#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.47][2\.47:1]]

(use test)
(include "frame.scm")

(let ((frame (make-frame (make-vect 0 0)
                         (make-vect 1 1)
                         (make-vect 2 2))))
  (test (make-vect 0 0) (origin-frame frame))
  (test (make-vect 1 1) (edge1-frame frame))
  (test (make-vect 2 2) (edge2-frame frame)))

;; The other representation.
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define edge2-frame cddr)

(let ((frame (make-frame (make-vect 0 0)
                         (make-vect 1 1)
                         (make-vect 2 2))))
  (test (make-vect 0 0) (origin-frame frame))
  (test (make-vect 1 1) (edge1-frame frame))
  (test (make-vect 2 2) (edge2-frame frame)))

;; 2\.47:1 ends here
