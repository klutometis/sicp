;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (last-pair list)
  (if (pair? list)
      (if (null? (cdr list))
          list
          (last-pair (cdr list)))
      (error "Not a pair -- LAST-PAIR")))
