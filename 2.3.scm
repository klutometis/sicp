#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*2.3][2\.3:1]]

(use sicp test)

(include "segment.scm")

(define (length p1 p2)
  (sqrt (+ (square (- (x-point p2)
                      (x-point p1)))
           (square (- (y-point p2)
                      (y-point p1))))))

(define (make-segment-rect s1 s2)
  (lambda (message)
    (case message
      ((length)
       (length (start-segment s1)
               (end-segment s1)))
      ((width)
       (length (start-segment s2)
               (end-segment s2))))))

(define (make-point-rect p1 p2 p3)
  (lambda (message)
    (case message
      ((length) (length p1 p2))
      ((width) (length p2 p3)))))

(define (perimeter rect)
  (* 2 (+ (rect 'length)
          (rect 'width))))

(define (area rect)
  (* (rect 'length) (rect 'width)))

(let ((r1 (make-segment-rect (make-segment (make-point 0 0)
                                           (make-point 2 0))
                             (make-segment (make-point 0 0)
                                           (make-point 0 3))))
      (r2 (make-point-rect (make-point 2 0)
                           (make-point 0 0)
                           (make-point 0 3))))
  (test 10.0 (perimeter r1))
  (test (perimeter r1) (perimeter r2))
  (test 6.0 (area r1))
  (test (area r1) (area r2)))

;; 2\.3:1 ends here
