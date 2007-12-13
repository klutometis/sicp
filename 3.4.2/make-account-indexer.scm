;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-indexed-account.scm")

(define (make-account-indexer)
  (let ((index -1))
    (define (make-account balance)
      (set! index (1+ index))
      (make-indexed-account balance index))
    (define (dispatch m)
      (cond ((eq? m 'make-account) make-account)
            (else (error "Unknown request -- MAKE-ACCOUNT-INDEXER" m))))
    dispatch))
