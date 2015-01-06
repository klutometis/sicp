#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.23][2\.23:1]]

(use test)

(define (for-each f list)
  (unless (null? list)
    (begin
      (f (car list))
      (for-each f (cdr list)))))

(let ((x '()))
  (for-each (lambda (i) (set! x (cons i x))) '(1 2 3))
  (test x '(3 2 1)))

;; 2\.23:1 ends here

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.24][2\.24:1]]

(use test)

(test '(1 (2 (3 4))) (list 1 (list 2 (list 3 4))))

;; 2\.24:1 ends here
