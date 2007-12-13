;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (bindings frames)
  (let ((bindings '()))
    (for-each
     (lambda (frame)
       (for-each
        (lambda (binding)
          (let ((addendum (list binding)))
            (if (null? bindings)
                (set! bindings addendum)
                (append! bindings addendum)))) frame)) frames)
    bindings))
