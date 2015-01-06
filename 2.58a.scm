#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.58][2\.58:1]]

(use sicp test)

(define addend car)
(define augend caddr)
(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

(define multiplier car)
(define multiplicand caddr)
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(test 4 (deriv '(x + (3 * (x + (y + 2)))) 'x))

;; 2\.58:1 ends here
