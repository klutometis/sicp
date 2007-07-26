(load "make-serializer.scm")
(load "parallel-execute.scm")
(load "wait.scm")

;; 100, 101, 110, 121.

(define x 10)

(define s (make-serializer))

(define wait-cycles 100000)

(parallel-execute (lambda ()
                    (wait)
                    (let ((y x))
                      (wait)
                      (let ((z x))
                        (wait)
                        (set! x ((s (lambda () (* y z)))))
                        (set! x (* y z))
                        (write-line x))))
                  (s
                   (lambda ()
                     (wait)
                     (let ((y x))
                       (wait)
                       (set! x (+ y 1))
                       (write-line x))))
                  )
