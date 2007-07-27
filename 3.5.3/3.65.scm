(load "test.scm")
(load "stream-converge.scm")
(load "accelerated-sequence.scm")
(load "make-tableau.scm")
(load "euler-transform.scm")
(load "ln2-stream.scm")

(define tolerance 0.001)

(define ln2
  (stream-converge ln2-stream tolerance))
(define ln2-transformed
  (stream-converge (euler-transform ln2-stream) tolerance))
(define ln2-accelerated
  (stream-converge
   (accelerated-sequence euler-transform ln2-stream) tolerance))

(test
 "convergence of ln2"
 1001
 (stream-length ln2)
 '=
 =)

(test
 "convergence of ln2 under euler-transformation"
 6
 (stream-length ln2-transformed)
 '=
 =)

(test
 "convergence of accelerated ln2-tableau"
 3
 (stream-length ln2-accelerated)
 '=
 =)

