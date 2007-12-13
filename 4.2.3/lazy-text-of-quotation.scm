;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (lazy-text-of-quotation exp env)
  (let ((text (cadr exp)))
    (if (and (not (null? text)) (list? text))
        (eval (fold-right (lambda (e1 e2) (list 'cons e1 e2)) (quote ()) text) env)
        text)))
