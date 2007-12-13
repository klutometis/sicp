;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (attach-tag type-tag contents)
  (if (and (eq? type-tag 'scheme-number) (number? contents))
      contents
      (cons type-tag contents)))

