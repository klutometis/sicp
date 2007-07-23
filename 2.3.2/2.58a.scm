(load "deriv.scm")

(define prefix '(+ x (* 3 (+ x (+ y 2)))))
(define infix '(x + (3 * (x + (y + 2)))))

(define deriv-prefix (deriv prefix 'x))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (exponentiation? x)
  (and (pair? x) (eq? (cadr x) '**)))

(define (addend x)
  (car x))

(define (multiplier x)
  (car x))

(define (base x)
  (car x))

(define deriv-infix (deriv infix 'x))

(eq? deriv-infix deriv-prefix)
