(load "add-to-agenda!.scm")
(load "current-time.scm")

(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
                  action
                  the-agenda))
