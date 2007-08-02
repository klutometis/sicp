(define exquadranda '(1 2 3 4))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(square-list exquadranda)
;; Cons' each new square to the beginning of the list
;; from back to front.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items '()))

(square-list exquadranda)
;; Cons-ing a list to an object results in nested lists,
;; since the consed list has a terminal nil.
