#!/usr/bin/env chicken-scheme

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
