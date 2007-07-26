;; Really some macro?
(define (cons-stream a b)
  (cons a (delay b)))
