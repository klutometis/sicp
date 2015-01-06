#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.18][3\.18:1]]

(use srfi-1 srfi-69 test)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (cycle? x)
  (let ((seen? (make-hash-table)))
    (let iter ((x x))
      (and (not (null? x))
           (or (hash-table-ref/default seen? x #f)
               (begin
                 (hash-table-set! seen? x #t)
                 (iter (cdr x))))))))

(test-assert (not (cycle? '(1 2 1))))
(test-assert (cycle? (make-cycle (list 1 2 1))))

;; 3\.18:1 ends here
