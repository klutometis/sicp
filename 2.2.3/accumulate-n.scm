;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "accumulate.scm")

;; Conceptually: cdr through each successive
;; sub-sequence (accumulate-n); accumulate the
;; car of each cdr'd subsequence (accumulate).
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons
       (accumulate op init (map car seqs))
       (accumulate-n op init (map cdr seqs)))))
