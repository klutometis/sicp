;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "begin-actions.scm")
(load "eval-sequence.scm")

;; NOTA BENE: does not take advantage of analysis!
(define (install-begin-package)
  (define (analyze-begin exp)
    (lambda (env) (eval-sequence (begin-actions exp) env)))
  (put 'begin analyze-begin)
  'done)
