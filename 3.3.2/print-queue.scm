(load "front-ptr.scm")

(load-option 'format)
(define (print-queue queue)
  (for-each (lambda (element) (format #t "~A " element)) (front-ptr queue))
  (newline))
