#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.14][3\.14:1]]

(use test)

(define (mystery x)
  (let loop ((x x)
             (y '()))
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x)))))

(let* ((v (list 'a 'b 'c 'd))
       (w (mystery v)))
  (test v '(a))
  (test w '(d c b a)))

;; 3\.14:1 ends here
