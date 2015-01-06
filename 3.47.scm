#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.47][3\.47:1]]

(use sicp-concurrency srfi-18 test)

(define (make-semaphore capacity)
  (let ((protect-capacity (make-mutex))
        (capacity-increased (make-condition-variable)))
    (define (release!)
      (with-mutex-locked protect-capacity
        (lambda ()
          (set! capacity (+ capacity 1))
          (condition-variable-broadcast! capacity-increased))))
    (define (acquire!)
      (mutex-lock! protect-capacity)
      (if (zero? capacity)
          (begin
            (mutex-unlock! protect-capacity capacity-increased)
            (acquire!))
          (begin
            (set! capacity (- capacity 1))
            (mutex-unlock! protect-capacity))))
    (lambda (message)
      (case message
        ((release!) (release!))
        ((acquire!) (acquire!))
        (else (error "Unknown message" message))))))

(define (semaphore-acquire! semaphore)
  (semaphore 'acquire!))

(define (semaphore-release! semaphore)
  (semaphore 'release!))

(define (with-semaphore-acquired semaphore thunk)
  (dynamic-wind
      (lambda () (semaphore-acquire! semaphore))
      thunk
      (lambda () (semaphore-release! semaphore))))

(let ((semaphore (make-semaphore 2))
      (result '()))
  (parallel-execute
   (lambda () (with-semaphore-acquired semaphore
           (lambda ()
             (thread-sleep! 0.1)
             (set! result (cons 2 result)))))
   ;; This should run last.
   (lambda () (with-semaphore-acquired semaphore
           (lambda ()
             (thread-sleep! 0.2)
             (test result '(1 2)))))
   (lambda () (with-semaphore-acquired semaphore
           (lambda ()
             (set! result (cons 1 result)))))))

;; 3\.47:1 ends here
