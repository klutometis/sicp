;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1-car (stream-car s1))
               (s2-car (stream-car s2)))
           (if (< (weight s1-car) (weight s2-car))
               (cons-stream s1-car (merge-weighted s2 (stream-cdr s1) weight))
               (cons-stream s2-car (merge-weighted s1 (stream-cdr s2) weight)))))))
