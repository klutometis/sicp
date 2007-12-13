;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (rear-insert-deque! deque item)
  ((deque 'rear-insert-deque!) item))
