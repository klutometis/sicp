(load "make-deque.scm")
(load "front-insert-deque!.scm")
(load "rear-insert-deque!.scm")
(load "front-delete-deque!.scm")
(load "rear-delete-deque!.scm")
(load "print-deque.scm")

;; For an illustration of deque's pair implementation, see 3.23.png.

(define deque (make-deque))
(define operations
  (list
   (lambda () (front-insert-deque! deque 'a))
   (lambda () (rear-insert-deque! deque 'b))
   (lambda () (front-insert-deque! deque 'c))
   (lambda () (front-delete-deque! deque))
   (lambda () (rear-delete-deque! deque))
   (lambda () (front-delete-deque! deque))
   ))

(for-each (lambda (operation) (print-deque (operation))) operations)
