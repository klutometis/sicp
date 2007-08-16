(define (sort-list list)
  (sort list
        (lambda (x y) (string<?
                       (list->string x)
                       (list->string y)))))
