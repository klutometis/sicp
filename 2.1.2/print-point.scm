(define (print-point point)
  (display (string-append "(" (number->string (x-point point)) ", " (number->string (y-point point)) ")"))
  (newline))
