(define (timed-result thunk)
  (let* ((start-time (current-time))
         (result (thunk))
         (end-time (current-time))
         (delta-time (apply - (map time->seconds
                                   (list end-time start-time)))))
    (values delta-time result)))
