;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "an-integer-between.scm")
(load "a-pythagorean-triple-between.scm")
(load "a-pythagorean-triple-between-efficient.scm")
(load "require.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-integer-between)

(ambeval-global a-pythagorean-triple-between)
(define inefficient
  (let ((result 0)
        (triples '()))
    (with-timings
     (lambda ()
       (set! triples (ambeval-global-until-fail
                      '(a-pythagorean-triple-between 1 20))))
     (lambda (run-time gc-time real-time)
       (set! result real-time)))
    (cons result triples)))
(define inefficient-time (car inefficient))
(define inefficient-triples (cdr inefficient))

(ambeval-global a-pythagorean-triple-between-efficient)
(define efficient
  (let ((result 0)
        (triples '()))
    (with-timings
     (lambda ()
       (set! triples (ambeval-global-until-fail
                      '(a-pythagorean-triple-between 1 20))))
     (lambda (run-time gc-time real-time)
       (set! result real-time)))
    (cons result triples)))
(define efficient-time (car efficient))
(define efficient-triples (cdr efficient))

(test
 "inefficient and efficient produce same triples"
 inefficient-triples
 efficient-triples
 'equal? equal?)

(test
 "inefficient is slower than efficient"
 "[1, inf)"
 (/ inefficient-time efficient-time)
 (> inefficient-time efficient-time)
 (lambda (n/a ratio) (> ratio 1.0)))

;; The efficient method reduces the test-space by rejecting those
;; pairs whose square exceeds the maximum's square.
