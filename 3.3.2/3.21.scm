;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-queue.scm")
(load "insert-queue!.scm")
(load "delete-queue!.scm")
(load "print-queue.scm")

(define q1 (make-queue))
(define operations
  (list
   (lambda () (insert-queue! q1 'a))
   (lambda () (insert-queue! q1 'b))
   (lambda () (delete-queue! q1))
   (lambda () (delete-queue! q1))))

(for-each (lambda (operation) (print-queue (operation))) operations)
