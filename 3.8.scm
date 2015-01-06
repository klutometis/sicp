#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.8][3\.8:1]]

(use test)

(define (make-f)
  (let ((init #f))
    (lambda (x)
      (if init
          0
          (begin
            (set! init x)
            init)))))

;; Left-to-right
(let ((f (make-f)))
  (test 0 (+ (f 0) (f 1))))

;; Right-to-left
(let ((f (make-f)))
  (test 1 (+ (f 1) (f 0))))

;; 3\.8:1 ends here
