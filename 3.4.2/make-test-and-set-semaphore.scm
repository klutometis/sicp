;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test-and-set!.scm")

(define (make-test-and-set-semaphore n)
  (define (make-cells n)
    (let make-cells ((i 0)
                     (cells '()))
      (if (< i n)
          (make-cells (1+ i) (cons (list false) cells))
          cells)))
  (let ((cells (make-cells n)))
    (define (acquire)
      (let ((acquirendum
             (find-matching-item cells
                               (lambda (cell) (false? (test-and-set! cell))))))
        (if (not acquirendum) (acquire))))
    (define (release)
      (let ((relaxandum
             (find-matching-item mutices
                                 (lambda (mutex) (test-and-set! cell)))))
        (if relaxandum
            (relaxandum 'release)
            (error "No set cells -- RELEASE" cells))))
    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
            ((eq? m 'release) (release))
            (else (error "Unknown request" m))))
    dispatch))
