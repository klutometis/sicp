#!/usr/bin/env chicken-scheme

(use sicp test)

(define (remove-first-agenda-item! agenda)
  (let ((q (segment-queue (first-segment agenda))))
    (set! q (cdr q))
    (if (null? q)
        (set-segments! agenda (rest-segments agenda)))))

(define (first-agenda-item agenda)
  (if (empty-agenda? agenda)
      (error "Agenda is empty: FIRST-AGENDA-ITEM")
      (let ((first-seg (first-segment agenda)))
        (set-current-time! agenda
                           (segment-time first-seg))
        (car (segment-queue first-seg)))))

(define (add-to-agenda! time action agenda)
  (define (belongs-before? segments)
    (or (null? segments)
        (< time (segment-time (car segments)))))
  (define (make-new-time-segment time action)
    (let ((q (list)))
      (set! q (cons action q))
      (make-time-segment time q)))
  (define (add-to-segments! segments)
    (if (= (segment-time (car segments)) time)
        (set-cdr! (car segments)
                  (cons action (segment-queue (car segments))))
        ;; (insert-queue! (segment-queue (car segments))
        ;;                action)
        (let ((rest (cdr segments)))
          (if (belongs-before? rest)
              (set-cdr!
               segments
               (cons (make-new-time-segment time action)
                     (cdr segments)))
              (add-to-segments! rest)))))
  (let ((segments (segments agenda)))
    (if (belongs-before? segments)
        (set-segments!
         agenda
         (cons (make-new-time-segment time action)
               segments))
        (add-to-segments! segments))))

(let ((a (make-wire 0))
      (b (make-wire 1))
      (c (make-wire))
      (d (make-wire))
      (e (make-wire)))
  (inverter a c)
  (inverter b d)
  (and-gate c d e)
  (propagate)
  (get-signal e))
