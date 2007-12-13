;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (query exp)
  (let ((q (query-syntax-process exp)))
    (cond ((assertion-to-be-added? q)
           (add-rule-or-assertion! (add-assertion-body q))
           'ok)
          (else
           (stream->list                ; Watch out for infinite streams
            (stream-map
             (lambda (environment)
               (instantiate q
                            environment
                            (lambda (v f)
                              (contract-question-mark v))))
             (qeval q (singleton-stream (make-environment)))))))))
