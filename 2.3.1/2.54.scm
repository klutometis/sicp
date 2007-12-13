;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define a (list 1 2 3))
(define b a)

(equal? a b)

(define (equal? a b)
  (cond ((and (null? a) (null? b))
         #t)
        ((or (and (null? a) (not (null? b)))
             (and (null? b) (not (null? a))))
         #f)
        ((not (eq? (car a) (car b)))
         #f)
        (else (equal? (cdr a) (cdr b)))))

(equal? a b)
