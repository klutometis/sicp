;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (index-key-of pat)
  (let ((key (car pat)))
    (if (var? key) '? key)))
