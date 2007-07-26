(load "stream-ref.scm")
(load "display-line.scm")

(define (display-stream-n stream n)
  (let display-next ((i 0))
    (if (< i n)
        (begin
          (display-line (stream-ref stream i))
          (display-next (1+ i))))))
