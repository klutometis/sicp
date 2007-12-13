;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define amb-qeval-map
  '(define (amb-qeval-map proc items)
     (if (null? items)
         '()
         (cons (proc (car items))
               (amb-qeval-map proc (cdr items))))))
