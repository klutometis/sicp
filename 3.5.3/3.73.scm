(load "RC.scm")
(load "stream-enumerate-interval.scm")

(define RC1 (RC 5 1 0.5))

(define voltages (stream-head (RC1 (stream-enumerate-interval -5 5) 0) 10))

(test
 "RC output voltages"
 '(0 -25 -22.5 -19.5 -16. -12. -7.5 -2.5 3. 9.)
 voltages
 'equal?
 equal?)

