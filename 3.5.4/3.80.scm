(load "RLC.scm")

(define circuit ((rlc 1 0.1 1 0.1) 10 0))

(define il (stream-head (car circuit) 10))
(define vc (stream-head (cdr circuit) 10))

(test
 "il stream from RLC"
 '(0 1. 1. .99 .98 .9701 .9602999999999999 .950599 .9409959999999999 .9314900099999999)
 il
 'equal?
 equal?)

(test
 "vc stream from RLC"
 '(10 10. 9.9 9.8 9.701 9.603 9.50599 9.40996 9.3149001 9.2208005)
 vc
 'equal?
 equal?)
