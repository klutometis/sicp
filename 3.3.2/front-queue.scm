(load "front-ptr.scm")
(load "empty-queue?.scm")

(define (front-queue queue)
  (if (empty-queue? queue)
      (eror "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))
