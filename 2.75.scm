#!/usr/bin/env chicken-scheme

(use test)

(define (make-from-mag-ang r a)
  (lambda (op)
    (cond ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          (else (error "Unknown op: MAKE-FROM-MAG-ANG" op)))))

(let ((magnitude (sqrt 2))
      (angle (atan 1)))
  (let ((number (make-from-mag-ang magnitude angle)))
    (test 1.0 (number 'real-part))
    (test 1.0 (number 'imag-part))
    (test magnitude (number 'magnitude))
    (test angle (number 'angle))))
