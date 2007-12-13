;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define an-element-of
  '(define (an-element-of items)
     (require (not (null? items)))
     (amb (car items) (an-element-of (cdr items)))))
