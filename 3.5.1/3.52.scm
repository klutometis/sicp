;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "stream-map.scm")
(load "stream-filter.scm")
(load "stream-ref.scm")
(load "display-stream.scm")
(load "stream-enumerate-interval.scm")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))

(stream-ref y 7)

(display-stream z)

;; Sum would remain the same even if delay had been implemented
;; without memo-proc; since, once the promises are forced, they are
;; not reevaluated.  (Seq is not a reevaluable procedure.)
