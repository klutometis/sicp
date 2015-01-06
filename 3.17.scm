#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.17][3\.17:1]]

(use srfi-69 test)

(define (count-pairs x)
  (let ((seen? (make-hash-table)))
    (let iter ((x x))
      (if (not (pair? x))
          0
          (+ (iter (car x))
             (iter (cdr x))
             (if (hash-table-ref/default seen? x #f)
                 0
                 (begin
                   (hash-table-set! seen? x #t) 1)))))))

(let* ((x (cons 1 2))
       (y (cons x x)))
  (test 3 (count-pairs (cons y y))))

;; 3\.17:1 ends here
