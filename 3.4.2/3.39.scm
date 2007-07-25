(load "make-serializer.scm")
(load "parallel-execute.scm")

;; 100, 110, 121.

(define (wait)
  (let* ((max 100000)
         (n (random max)))
    (let lp ((i 0))
      (if (< i n)
          (lp (1+ i))))))

(define x 10)

(define s (make-serializer))

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
