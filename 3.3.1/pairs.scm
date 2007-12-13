;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-pair.scm")

(define p3
  (make-pair
   'p3
   '(a b c)))

(define p4
  (make-pair
   'p4
   (let ((p '(a b)))
     (cons p (cdr p)))))

(define p7
  (make-pair
   'p7
   (let* ((p '(a))
          (q (cons p p)))
     (cons q q))))

(define pinf
  (make-pair
   'pinf
   (let ((q '(a b c)))
     (set-cdr! (cddr q) q)
     q)))

(define pairs (list p3 p4 p7 pinf))
