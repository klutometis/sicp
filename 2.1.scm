#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.1][2\.1:1]]

(use (only sicp xor) test)

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n (/ n g))
          (d (/ d g)))
      (let ((n (if (xor (negative? n)
                        (negative? d))
                   (- (abs n))
                   (abs n)))
            (d (abs d)))
        (cons n d)))))

(test '(2 . 1) (make-rat 8 4))
(test '(2 . 1) (make-rat -8 -4))
(test '(-2 . 1) (make-rat 8 -4))
(test '(-2 . 1) (make-rat -8 4))

;; 2\.1:1 ends here
