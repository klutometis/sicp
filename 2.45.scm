#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.45][2\.45:1]]

(use sicp)

(define (split first-preposition second-preposition)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split first-preposition second-preposition)
                        painter
                        (- n 1))))
          (first-preposition painter (second-preposition smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(write-painter-to-png (right-split (image->painter "lena.png") 4)
                      "2.45-right-split.png")
(write-painter-to-png (up-split (image->painter "lena.png") 4)
                      "2.45-up-split.png")

;; 2\.45:1 ends here
