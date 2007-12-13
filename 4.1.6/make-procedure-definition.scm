;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-procedure-definition definition-variable definition-value body)
  (cons 'define (cons (cons definition-variable definition-value) body)))
