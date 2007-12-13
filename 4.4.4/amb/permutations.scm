;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Snarfed from Rosen, Discrete Mathematics, 6th ed., p. 384.
;; Imperatasterish (cf. -aster in poetaster, etc.); but autonomizeth
;; and worketh.

;; See http://paste.lisp.org/display/46140 for non-destructive
;; virtuosity from j85wilson.
(define (permutations elements)
  (define (vector-interchange! elements j k)
    (let ((aj (vector-ref elements j))
          (ak (vector-ref elements k)))
      (vector-set! elements j ak)
      (vector-set! elements k aj)))
  (define (next-permutation elements)
    (let* ((n (vector-length elements))
           (j (-1+ n)))
      (let last-non-decreasing-adjacents ((elements elements))
        (let ((n (vector-length elements)))
          (if (< n 2)
              j
              (let ((aj (vector-ref elements (-1+ (-1+ n))))
                    (aj+1 (vector-ref elements (-1+ n))))
                (if (> aj aj+1)
                    (begin
                      (set! j (-1+ j))
                      (last-non-decreasing-adjacents
                       (vector-head elements (-1+ n))))
                    j)))))
      (let* ((k n)
             (ak #!default)
             (aj (vector-ref elements (-1+ j))))
        (let smallest-aj>ak ((elements elements))
          (let ((n (vector-length elements)))
            (if (= n j)
                k
                (let ((an (vector-ref elements (-1+ n))))
                  (if (and (> an aj) (or (default-object? ak) (> ak an)))
                      (begin (set! ak an)
                             (set! k n)))
                  (smallest-aj>ak (vector-head elements (-1+ n)))))))
        (vector-interchange! elements (-1+ j) (-1+ k)))
      (let vector-shift! ((r n)
                          (s (1+ j)))
        (if (> r s)
            (begin (vector-interchange! elements (-1+ r) (-1+ s))
                   (vector-shift! (-1+ r) (1+ s)))
            elements))))
  (define (decreasing? elements)
    (if (null? (cdr elements))
        true
        (if (> (car elements) (cadr elements))
            (decreasing? (cdr elements))
            false)))
  (cons-stream elements
               (if (decreasing? elements)
                   the-empty-stream
                   (permutations (vector->list (next-permutation (list->vector elements)))))))
