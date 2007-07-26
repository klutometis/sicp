(load "ones.scm")
(load "add-streams.scm")

(define (integers-starting-from n)
  (cons-stream n (add-streams ones (integers-starting-from n))))
