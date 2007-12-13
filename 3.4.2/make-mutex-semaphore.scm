;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-non-blocking-mutex.scm")

;; May be cheating in the sense that make-non-blocking-mutex is a thin
;; wrapper around test-and-set!.
(define (make-mutex-semaphore n)
  (define (make-mutices n)
    (let make-mutices ((i 0)
                       (mutices '()))
      (if (< i n)
          (make-mutices (1+ i) (cons (make-non-blocking-mutex) mutices))
          mutices)))
  (let ((mutices (make-mutices n)))
    (define (acquire)
      (let ((acquirendum
             (find-matching-item mutices
                               (lambda (mutex) (false? (mutex 'acquire))))))
        (if (not acquirendum) (acquire))))
    (define (release)
      (let ((relaxandum
             (find-matching-item mutices
                                 (lambda (mutex) (mutex 'release)))))
        (if relaxandum
            (relaxandum 'release)
            (error "No acquired mutices -- RELEASE" mutices))))
    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
            ((eq? m 'release) (release))
            (else (error "Unknown request" m))))
    dispatch))
