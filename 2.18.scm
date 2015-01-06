#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.18][2\.18:1]]

(use test)

(define (reverse list)
  (let iter ((reverse '())
             (list list))
    (if (null? list)
        reverse
        (iter (cons (car list) reverse)
              (cdr list)))))

(test '(25 16 9 4 1)
      (reverse (list 1 4 9 16 25)))

;; 2\.18:1 ends here
