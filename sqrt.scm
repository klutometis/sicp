(define (square x) (* x x))

;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-claus)
;;         (else else-clause)))

;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x)
;;                  x)))

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (begin
        (set! last-guess guess)
        (set! guess (improve guess x))
        (sqrt-iter guess last-guess x))
      )
  )

(define (cbrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (begin
        (set! last-guess guess)
        (set! guess (improve-cube guess x))
        (cbrt-iter guess last-guess x))
      )
  )

(define (improve guess x)
       (average guess (/ x guess)))

(define (improve-cube guess x)
       (cube-average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Redefine for cube-roots
(define (cube-average x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess last-guess x)
  (< (abs (- (abs guess) (abs last-guess))) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))

(define (cbrt x)
  (cbrt-iter 1.0 0.0 x))

(cbrt 8)
(sqrt 81)
;; (sqrt 152415787748818788100)
;; (sqrt .00000000000000000152)  ; Stops at `0.03125'.
;; (sqrt .00000000000000000000000001)
;; (sqrt 152415787501905210000000000000000000000)      ; Infinite loop at `1.0'.
