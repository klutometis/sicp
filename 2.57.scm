#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.57][2\.57:1]]

(use sicp test)

(define (augend x)
  (let ((augenda (cddr x)))
    (if (null? (cdr augenda))
        (car augenda)
        (cons '+ augenda))))

(define (multiplicand x)
  (let ((multiplicanda (cddr x)))
    (if (null? (cdr multiplicanda))
        (car multiplicanda)
        (cons '* multiplicanda))))

(test '(+ (* x y) (* y (+ x 3))) (deriv '(* x y (+ x 3)) 'x))

;; 2\.57:1 ends here
