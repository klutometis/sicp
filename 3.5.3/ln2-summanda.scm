;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (ln2-summanda n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summanda (1+ n)))))
