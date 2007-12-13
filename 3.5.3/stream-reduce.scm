;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (stream-reduce procedure initial stream)
  (if (stream-null? stream)
      initial
      (let accumulate ((stream stream)
                       (accumulation initial))
        (if (stream-null? stream)
            accumulation
            (accumulate (stream-cdr stream) (procedure accumulation (stream-car stream)))))))
