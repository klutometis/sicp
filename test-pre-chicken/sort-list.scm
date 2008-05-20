;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (sort-list list)
  (sort list
        (lambda (x y) (string<?
                       (list->string x)
                       (list->string y)))))
