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
