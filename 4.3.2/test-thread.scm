(load "parallel-execute.scm")

(define (a) (write (get-universal-time)) (a))
(let ((thread (create-thread #f
                             (lambda ()
                               (a)))))
  (detach-thread thread)
  (let ((thread-two (create-thread #f
                                   (lambda ()
                                     (kill-thread thread)
                                     (newline)))))
    (detach-thread thread-two)))
