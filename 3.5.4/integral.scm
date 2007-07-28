(load "add-streams.scm")
(load "scale-stream.scm")

(define (integral delayed-integrand initial-value dt)
    (cons-stream initial-value
                 (if (stream-null? delayed-integrand)
                     the-empty-stream
                     (let ((integrand (force delayed-integrand)))
                       (integral (delay (stream-cdr integrand))
                                 (+ (* dt (stream-car integrand))
                                    initial-value)
                                 dt)))))
