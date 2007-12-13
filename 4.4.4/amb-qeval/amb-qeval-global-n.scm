;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (amb-qeval-global-n exp n)
  (ambeval-global-n (ambeval-global exp) n))
