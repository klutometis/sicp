;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-monitored function)
  (let ((applicata 0))
    (define (apply applicandum)
      (set! applicata (+ 1 applicata))
      (function applicandum))
    (define (how-many-calls?)
      applicata)
    (define (reset-counter)
      (set! applicata 0)
      applicata)
    (define (dispatch message)
      (cond ((eq? message 'how-many-calls?) (how-many-calls?))
            ((eq? message 'reset-counter) (reset-counter))
            (else (apply message))))
    dispatch))

(define s (make-monitored sqrt))
(s 100)
(s 1000)
(s 'how-many-calls?)
(s 'reset-counter)
