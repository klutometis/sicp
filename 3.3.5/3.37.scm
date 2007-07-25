(load "make-connector.scm")
(load "set-value!.scm")
(load "probe.scm")
(load "c+.scm")
(load "c*.scm")
(load "c\\.scm")
(load "cv.scm")

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)

(set-value! C 25 'user)
(forget-value! C 'user)
(set-value! F 212 'user)
