(load "append!.scm")

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

(write-line z)
(write-line x)
;; (a b)

(define w (append! x y))

(write-line w)
(write-line x)
;; (a b c d)

;; See 3.12{a,b,c}.png for box diagrams.
