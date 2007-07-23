(define hello
  (let ((x (delay (+ 2 2))))
    x))

(* (force hello) (force hello))
