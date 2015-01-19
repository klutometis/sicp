#!/usr/bin/env chicken-scheme

(include "segment.scm")
(include "vect.scm")

(define outline
  (list
   (make-segment (make-vect 0 0) (make-vect 0 1))
   (make-segment (make-vect 0 1) (make-vect 1 1))
   (make-segment (make-vect 1 1) (make-vect 1 0))
   (make-segment (make-vect 1 0) (make-vect 0 0))))

(define x
  (list
   (make-segment (make-vect 0 0) (make-vect 1 1))
   (make-segment (make-vect 0 1) (make-vect 1 0))))

(define diamond
  (list
   (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
   (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
   (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
   (make-segment (make-vect 0 0.5) (make-vect 0.5 0))))

;; Needs to be asymmetrical, so we can see rotations and flips.
(define wave
  (list
   ;; Left leg
   (make-segment (make-vect 0.3 1) (make-vect 0.4 0.6))
   (make-segment (make-vect 0.4 1) (make-vect 0.5 0.7))
   ;; Right leg
   (make-segment (make-vect 0.6 1) (make-vect 0.5 0.7))
   (make-segment (make-vect 0.7 1) (make-vect 0.6 0.6))
   ;; Torso
   (make-segment (make-vect 0.4 0.6) (make-vect 0.4 0.4))
   (make-segment (make-vect 0.6 0.6) (make-vect 0.6 0.4))
   ;; Left arm
   (make-segment (make-vect 0.4 0.4) (make-vect 0.2 0.35))
   (make-segment (make-vect 0.2 0.35) (make-vect 0.2 0.25))
   (make-segment (make-vect 0.2 0.25) (make-vect 0.45 0.3))
   ;; Right arm
   (make-segment (make-vect 0.6 0.4) (make-vect 0.8 0.45))
   (make-segment (make-vect 0.8 0.45) (make-vect 0.8 0.35))
   (make-segment (make-vect 0.8 0.35) (make-vect 0.55 0.3))
   ;; Neck
   (make-segment (make-vect 0.45 0.3) (make-vect 0.45 0.25))
   (make-segment (make-vect 0.55 0.3) (make-vect 0.55 0.25))
   ;; Head
   (make-segment (make-vect 0.45 0.25) (make-vect 0.425 0.25))
   (make-segment (make-vect 0.425 0.25) (make-vect 0.425 0.05))
   (make-segment (make-vect 0.425 0.05) (make-vect 0.575 0.05))
   (make-segment (make-vect 0.575 0.05) (make-vect 0.575 0.25))
   (make-segment (make-vect 0.575 0.25) (make-vect 0.55 0.25))))
