#!/usr/bin/env chicken-scheme

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! new-front-ptr)
      (set! front-ptr new-front-ptr))
    (define (set-rear-ptr! new-rear-ptr)
      (set! rear-ptr new-rear-ptr))
    (define (empty-queue?)
      (null? front-ptr))
    (lambda (message)
      (case message
        ((front-ptr) front-ptr)
        ((rear-ptr) rear-ptr)
        ((set-front-ptr!) set-front-ptr!)
        ((set-rear-ptr!) set-rear-ptr!)
        ((empty?) empty-queue?)
        ((front)
         (if (empty-queue?)
             (error "FRONT called with an empty queue")
             (car front-ptr)))
        ((insert!)
         (lambda (item)
           (let ((new-pair (cons item '())))
             (cond ((empty-queue?)
                    (set-front-ptr! new-pair)
                    (set-rear-ptr! new-pair))
                   (else
                    (set-cdr! rear-ptr new-pair)
                    (set-rear-ptr! new-pair))))))
        ((delete!)
         (cond ((empty-queue?)
                (error "DELETE! called with an empty queue"))
               (else (set-front-ptr! (cdr front-ptr)))))
        ((print) (display front-ptr))))))

(define (front-ptr queue) (queue 'front-ptr))
(define (rear-ptr queue) (queue 'rear-ptr))
(define (set-front-ptr! queue item)
  ((queue 'set-front-ptr!) item))
(define (set-rear-ptr! queue item)
  ((queue 'set-rear-ptr!) item))
(define (empty-queue? queue) (queue 'empty?))
(define (front-queue queue) (queue 'front))

(define (insert-queue! queue item)
  ((queue 'insert!) item))

(define (delete-queue! queue)
  (queue 'delete!))

(define (print-queue queue) (queue 'print))

(define q1 (make-queue))
(test "(a)"
      (with-output-to-string (lambda () (insert-queue! q1 'a) (print-queue q1))))
(test "(a b)"
      (with-output-to-string (lambda () (insert-queue! q1 'b) (print-queue q1))))
(test "(b)"
      (with-output-to-string (lambda () (delete-queue! q1) (print-queue q1))))
(test "()"
      (with-output-to-string (lambda () (delete-queue! q1) (print-queue q1))))
