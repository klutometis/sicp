;;; Equal to 4 decimal places.
(define (approx? x y)
  (approx-n? x y 4))

(define (approx-n? x y n)
  (let* ((precision (expt 10 n))
         (precise (lambda (x) (exact-round (* x precision)))))
    (= (precise x) (precise y))))

;;; Purports to solve the Turing halting problem for a limited
;;; temporal domain.  Thanks to aspect on #scheme for the fall-through
;;; and-hack.
(define (terminate? thunk)
  (let ((thread (thread-start! (make-thread thunk))))
    (and (thread-join! thread 1 #f)
         (thread-terminate! thread)
         #t)))

(define (except? thunk)
  (call-with-current-continuation
   (lambda (return)
     (with-exception-handler
      (lambda (exception) (return #t))
      (lambda () (thunk) #f)))))
