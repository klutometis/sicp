;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         accumulate
         accumulate-n)

;; Additively accumulate the successive products of nth
;; pairse.
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; A series of dot-products per row.
(define (matrix-*-vector m v)
  (map (lambda (m) (dot-product m v)) m))

;; Forge a new list (row) out of each nth
;; list (col).
(define (transpose-matrix m)
  (accumulate-n cons '() m))

;; Dot product of each multiplier's row
;; by each multiplicand's column (transposed
;; row).
(define (matrix-*-matrix m n)
  (let ((cols (transpose-matrix n)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)))

;; If we repeal the (map <??> m) constaint, and use instead the more general
;; (map <??> <??>), we have the matrix-vector
;; product for each column of the multiplicand (thanks, Nobsun):
(define (matrix-*-matrix m n)
  (let ((cols (transpose-matrix n)))
    (map (lambda (col) (matrix-*-vector m col)) cols)))

(let ((matrix '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
      (vector '(1 2 3 4)))
  (check (dot-product vector vector) => 30)
  (check (matrix-*-vector matrix vector)
         => '(30 56 80))
  (check (transpose-matrix matrix)
         => '((1 4 6) (2 5 7) (3 6 8) (4 6 9)))
  (check (matrix-*-matrix matrix (transpose-matrix matrix))
         => '((30 56 80) (56 113 161) (80 161 230)))
  (check (matrix-*-matrix matrix (transpose-matrix matrix))
         => '((30 56 80) (56 113 161) (80 161 230))))
