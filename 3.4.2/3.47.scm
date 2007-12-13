;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load-option 'format)

(load "make-mutex-semaphore.scm")
(load "make-test-and-set-semaphore.scm")
(load "format-serialized.scm")

(define n-locks 3)
(define n-superfluity 4)
(define sleep-interval 10000)

(define mutex-semaphore (make-mutex-semaphore n-locks))
(define test-and-set-semaphore (make-test-and-set-semaphore n-locks))
(define semaphore-tests
  (list (cons 'mutex-semaphore mutex-semaphore)
        (cons 'test-and-set-semaphore mutex-semaphore)))

(define (test-semaphore semaphore-name semaphore)
  (let acquisition-loop ((i 0))
    (if (< i (+ n-locks n-superfluity))
        (begin
          (let* ((name (format #f "~A ~A" semaphore-name i))
                 (update (lambda (saw) (format-serialized #t "~A: ~A~%" name saw)))
                 (thread (create-thread #f
                                        (lambda ()
                                          (semaphore 'acquire)
                                          (update "acquired semaphore")
                                          ;; Creates non-deterministic
                                          ;; behaviour; current-thread
                                          ;; is unpredictable.
                                          (sleep-current-thread
                                           (random sleep-interval))
                                          (semaphore 'release)
                                          (update "released semaphore")))))
            (detach-thread thread)
            (acquisition-loop (1+ i)))))))

(map (lambda (semaphore-test)
       (let ((semaphore-name (car semaphore-test))
             (semaphore (cdr semaphore-test)))
         (test-semaphore semaphore-name semaphore))) semaphore-tests)
