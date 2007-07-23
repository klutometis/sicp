(define (f x)
  (let* ((w 2)
        (y w))
    y))

(f 3)

;; (let ((x 0)) (define (rags y) x))
;; (define (rags y)
;;   (let ((index 0))
;;     (set! index (+ index 1))
;;     (write-line 'oeuhrt)
;;     (if (= index y)
;;         #t
;;         (rags y))))

;; (rags 2)
