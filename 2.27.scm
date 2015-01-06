#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.25][2\.25:1]]

(use test)

(test 7 (car (cdaddr '(1 3 (5 7) 9))))
(test 7 (caar '((7))))
(test 7 (cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7))))))))))

;; 2\.25:1 ends here

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.27][2\.27:1]]

(use test)

(define (deep-reverse list)
  (let iter ((list list)
             (reverse '()))
    (if (null? list)
        reverse
        (let ((first (car list)))
          (iter (cdr list)
                (cons (if (pair? first)
                          (deep-reverse first)
                          first)
                      reverse))))))

;; Or using higher-order functions.
(define (deep-reverse list)
  (reverse (map (lambda (element)
                  (if (pair? element)
                      (deep-reverse element)
                      element))
                list)))

(test '(((7 6 5) 4 3) (2 1))
      (deep-reverse '((1 2) (3 4 (5 6 7)))))

;; 2\.27:1 ends here
