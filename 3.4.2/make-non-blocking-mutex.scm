(load "clear!.scm")
(load "test-and-set!.scm")

(define (make-non-blocking-mutex)
  (let ((cell (list false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire) (test-and-set! cell))
            ((eq? m 'release) (clear! cell))))
    the-mutex))
