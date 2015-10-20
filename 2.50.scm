#!/usr/bin/env chicken-scheme
(use sicp)

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define rotate180 (compose rotate90 rotate90))
(define rotate270 (compose rotate180 rotate90))

(write-painter-to-png (flip-horiz (image->painter "lena.png")) "2.50-horiz.png")
(write-painter-to-png (rotate180 (image->painter "lena.png")) "2.50-rotate180.png")
(write-painter-to-png (rotate270 (image->painter "lena.png")) "2.50-rotate270.png")
