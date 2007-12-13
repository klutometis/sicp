;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "stream-ref.scm")
(load "display-line.scm")

(define (display-stream-n stream n)
  (let display-next ((i 0))
    (if (< i n)
        (begin
          (display-line (stream-ref stream i))
          (display-next (1+ i))))))
