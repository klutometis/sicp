(load "=number?.scm")
(load "deriv.scm")

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier x)
  (car x))

(define (addend x)
  (car x))

(define (base x)
  (car x))

(define (multiplicand x)
  (if (> (length x) 3)
      (cddr x)
      (caddr x)))

(define (augend x)
  (if (> (length x) 3)
      (let ((rest (cddr x)))
        (if (product? rest)
            (make-product (multiplier rest) (multiplicand rest))
            rest))
      (caddr x)))

(deriv '(x + 3 * (x + y + 2)) 'x)
