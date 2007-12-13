;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define list-operations
  (list
   '(define (cons x y)
      (lambda (m) (m x y)))
   '(define (car z)
      (z (lambda (p q) p)))
   '(define (cdr z)
      (z (lambda (p q) q)))
   '(define (list-ref items n)
      (if (= n 0)
          (car items)
          (list-ref (cdr items) (- n 1))))
   '(define (map proc items)
      (if (null? items)
          '()
          (cons (proc (car items))
                (map proc (cdr items)))))
   '(define (scale-list items factor)
      (map (lambda (x) (* x factor))
           items))
   '(define (add-lists list1 list2)
      (cond ((null? list1) list2)
            ((null? list2) list1)
            (else (cons (+ (car list1) (car list2))
                        (add-lists (cdr list1) (cdr list2))))))))
