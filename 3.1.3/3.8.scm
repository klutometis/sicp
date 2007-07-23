(define new-f
  (let ((current 1))
    (lambda (x)
      (set! current (* current x))
      current)))

(define applications (lambda () (list (f 0) (f 1))))

;; Simulate right-to-left
(define f new-f)
(reduce + 0 (applications))

;; Simulate left-to-right
(define f new-f)
(reduce-right + 0 (applications))
