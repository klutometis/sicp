#!/usr/bin/env chicken-scheme

(use sicp-constraints test)

(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0: SQUARER"
                   (get-value b))
            (set-value! a (sqrt (get-value b)) me))
        (set-value! b (* (get-value a) (get-value a)) me)))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (case request
      ((I-have-a-value) (process-new-value))
      ((I-lost-my-value) (process-forget-value))
      (else (error "Unknown request: SQUARER" request))))
  (connect a me)
  (connect b me)
  me)

(let ((a (make-connector))
      (b (make-connector)))
  (squarer a b)
  (set-value! b 2 'user)
  (test 1.4142135623731 (get-value a)))

(let ((a (make-connector))
      (b (make-connector)))
  (squarer a b)
  (set-value! a 2 'user)
  (test 4 (get-value b)))
