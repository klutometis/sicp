(load "make-queue-local.scm")
(load "insert-queue!-local.scm")
(load "delete-queue!-local.scm")
(load "print-queue.scm")

(define q1 (make-queue-local))
(define operations
  (list
   (lambda () (insert-queue!-local q1 'a))
   (lambda () (insert-queue!-local q1 'b))
   (lambda () (delete-queue!-local q1))
   (lambda () (delete-queue!-local q1))))

(for-each (lambda (operation) (print-queue (operation))) operations)
