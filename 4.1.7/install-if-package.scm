;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "analyze.scm")
(load "if-predicate.scm")
(load "if-consequent.scm")
(load "if-alternative.scm")
(load "true?.scm")

(define (install-if-package)
  (define (analyze-if exp)
    (let ((pproc (analyze (if-predicate exp)))
          (cproc (analyze (if-consequent exp)))
          (aproc (analyze (if-alternative exp))))
      (lambda (env)
        (if (true? (pproc env))
            (cproc env)
            (aproc env)))))
  (put 'if analyze-if)
  'done)
