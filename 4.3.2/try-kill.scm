;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "parallel-execute.scm")
(load "test-return.scm")

(define (try-kill assay test-name interval)
  (let ((result #!default))
    (let ((filum
           (create-thread
            #f (lambda () (assay)))))
      (register-timer-event
       interval
       (lambda () (kill-thread filum) (test-return test-name result))))))
