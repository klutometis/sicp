(load "test.scm")
(load "integrate-series.scm")
(load "display-stream-n.scm")
(load "ones.scm")
(load "exp-series.scm")
(load "negate-stream.scm")
(load "trig-series.scm")

(define integration-coeff (stream-head (integrate-series ones) 10))
(define exp-coeff (stream-head exp-series 10))
(define cosine-coeff (stream-head cosine-series 10))
(define sine-coeff (stream-head sine-series 10))

(test
 "integration coefficients of (integral 1 + x + x^2 ...)"
 '(1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 1/10)
 integration-coeff
 'equal?
 equal?)

(test
 "e^x power-series coefficients"
 '(1 1 1/2 1/6 1/24 1/120 1/720 1/5040 1/40320 1/362880)
 exp-coeff
 'equal?
 equal?)

(test
 "cosine power-series coefficients"
 '(1 0 -1/2 0 1/24 0 -1/720 0 1/40320 0)
 cosine-coeff
 'equal?
 equal?)

(test
 "sine power-series coefficients"
 '(0 1 0 -1/6 0 1/120 0 -1/5040 0 1/362880)
 sine-coeff
 'equal?
 equal?)
