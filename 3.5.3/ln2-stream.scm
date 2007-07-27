(load "ln2-summanda.scm")
(load "partial-sums.scm")

(define ln2-stream
  (partial-sums (ln2-summanda 1)))
