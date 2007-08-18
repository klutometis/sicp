;; Thanks mejja, Riastradh; see
;; http://mumble.net/~campbell/tmp/loop-comparison.scm and
;; http://paste.lisp.org/display/46043

;; Infinite streams not provided for! Shit.
(define (n-ary-cartesian streams)
  (if (null? streams)
      (stream the-empty-stream)
      (stream-append-map (let ((tails (n-ary-cartesian (cdr streams))))
                           (lambda (first)
                             (stream-map (lambda (rest)
                                    (cons first rest))
                                  tails)))
                         (car streams))))

;(n-ary-cartesian (list (stream 1 2 3) (stream 4 5 6)))
