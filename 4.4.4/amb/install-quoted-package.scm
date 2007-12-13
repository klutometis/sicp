;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (install-quoted-package)
  (define (analyze-quoted exp)
    (let ((qval (text-of-quotation exp)))
      (lambda (env succeed fail)
        (succeed qval fail))))
  (put-amb 'quote analyze-quoted)
  'done)
