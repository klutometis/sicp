(load "random-init.scm")
(load "rand-update.scm")

(define (make-random-numbers)
  (define generate
    (cons-stream random-init
                 (stream-map rand-update generate)))
  (define (reset initial-value)
    (define numbers
      (cons-stream initial-value
                   (stream-map rand-update numbers)))
    numbers)
  (define (dispatch m)
    (cond ((eq? m 'generate) generate)
          ((eq? m 'reset) reset)
          (else (error "Unknown request -- RANDOM-NUMBERS" m))))
  dispatch)
