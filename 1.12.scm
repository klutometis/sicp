#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.12][1\.12:1]]

(use test)

(define (pascal row element)
  (cond ((or (zero? element)
             (= row element))
         1)
        ((negative? row) 0)
        (else
         (+ (pascal (- row 1)
                    (- element 1))
            (pascal (- row 1)
                    element)))))

(define (pascal-row row)
  (let iter ((element 0)
             (elements '()))
    (if (> element row)
        elements
        (iter (+ element 1)
              (cons (pascal row element) elements)))))

(test 2 (pascal 2 1))
(test 3 (pascal 3 1))
(test '(1 3 3 1) (pascal-row 3))

;; 1\.12:1 ends here
