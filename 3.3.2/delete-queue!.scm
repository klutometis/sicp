(load "empty-queue?.scm")
(load "set-front-ptr!.scm")
(load "front-ptr.scm")

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))
