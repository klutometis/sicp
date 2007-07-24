(load "segments.scm")

(define (empty-agenda? agenda)
  (null? (segments agenda)))
