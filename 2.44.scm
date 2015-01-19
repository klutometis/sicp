#!/usr/bin/env chicken-scheme

(use sicp)

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(write-painter-to-png (up-split (image->painter "lena.png") 2) "2.44.png")
