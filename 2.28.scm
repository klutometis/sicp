#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.28][2\.28:1]]

(use test)

(define (fringe list)
  (let iter ((list list)
             (leaves '()))
    (if (null? list)
        leaves
        (let ((first (car list)))
          (iter (cdr list)
                (if (pair? first)
                    (append (fringe first) leaves)
                    (cons first leaves)))))))

(define x '((1 2) (3 4)))
(test '(4 3 2 1) (fringe x))
(test '(4 3 2 1 4 3 2 1) (fringe (list x x)))

;; 2\.28:1 ends here
