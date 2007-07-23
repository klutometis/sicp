(load "mystery.scm")

(define v (list 'a 'b 'c 'd))
(define w (mystery v))

(write-line w)
(write-line v)

;; See 3.14.png.
