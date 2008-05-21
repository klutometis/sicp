;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../util/util)
(import* util square)

(define exquadranda '(1 2 3 4))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(check (square-list exquadranda)
       => '(16 9 4 1))
;; Cons' each new square to the beginning of the list
;; from back to front.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items '()))

(check (square-list exquadranda)
       => '((((() . 1) . 4) . 9) . 16))
;; Cons-ing a list to an object results in nested lists,
;; since the consed list has a terminal nil.
