(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "distinct?.scm")
(load "multiple-dwelling.scm")
(load "multiple-dwelling-hierarchical.scm")

(install-packages)
(ambeval-global require)
(ambeval-global distinct?)
(ambeval-global multiple-dwelling)
(ambeval-global multiple-dwelling-hierarchical)

(define original
  (let ((time 0)
        (result '()))
    (with-timings
     (lambda ()
       (set! result (ambeval-global-until-fail '(multiple-dwelling))))
     (lambda (run gc real)
       (set! time real)))
    (cons time result)))
(define original-time (car original))
(define original-result (cdr original))

(define hierarchical
  (let ((time 0)
        (result '()))
    (with-timings
     (lambda ()
       (set! result (ambeval-global-until-fail '(multiple-dwelling-hierarchical))))
     (lambda (run gc real)
       (set! time real)))
    (cons time result)))
(define hierarchical-time (car hierarchical))
(define hierarchical-result (cdr hierarchical))

(test
 "hierarchical and original produce same answer"
 original-result
 hierarchical-result
 'equal? equal?
 "SICP 4.3.2")

(test
 "hierarchical faster than original"
 "[1, inf)"
 (/ original-time hierarchical-time)
 "original / hierarchical > 1.0"
 (lambda (n/a ratio) (> ratio 1.0)))
