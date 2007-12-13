;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

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
