(load "accumulate.scm")
(load "accumulate-n.scm")

(define matrix '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define vector '(1 2 3 4))

;; Additively accumulate the successive products of nth
;; pairse.
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product vector vector)

;; A series of dot-products per row.
(define (matrix-*-vector m v)
  (map (lambda (m) (dot-product m v)) m))

(matrix-*-vector matrix vector)

;; Forge a new list (row) out of each nth
;; list (col).
(define (transpose-matrix m)
  (accumulate-n cons '() m))

(transpose-matrix matrix)

;; Dot product of each multiplier's row
;; by each multiplicand's column (transposed
;; row).
(define (matrix-*-matrix m n)
  (let ((cols (transpose-matrix n)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)))

(matrix-*-matrix matrix (transpose-matrix matrix))

;; If we repeal the (map <??> m) constaint, and use instead the more general
;; (map <??> <??>), we have the matrix-vector
;; product for each column of the multiplicand (thanks, Nobsun):
(define (matrix-*-matrix m n)
  (let ((cols (transpose-matrix n)))
    (map (lambda (col) (matrix-*-vector m col)) cols)))

(matrix-*-matrix matrix (transpose-matrix matrix))
