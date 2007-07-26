(load "stream-map.scm")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))
