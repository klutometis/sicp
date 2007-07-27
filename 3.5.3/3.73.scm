(load "RC.scm")

(define RC1 (RC 5 1 0.5))

(define voltages (stream-head (RC1 (stream 1 2 3 4 5) 1) 5))

(test
 "RC output voltages"
 '(1 6 11.5 17.5 24.)
 voltages
 'equal?
 equal?)

