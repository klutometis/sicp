#!/usr/bin/env chicken-scheme

(use sicp-eval sicp-eval-amb)

(with-require `((list ,list) (eq? ,eq?))
  (lambda (env)
    (ambeval*
     `(define (yachts)
        (let ((moore (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)))
          (require (eq? moore 'mary))
          ;; This is redundant.
          (require (not (eq? moore 'lorna)))
          (let ((downing (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)))
            (require (not (eq? downing 'melissa)))
            (let ((hall (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)))
              (require (not (eq? hall 'rosalind)))
              (let ((hood (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)))
                (require (eq? hood 'melissa))
                ;; This is redundant.
                (require (not (eq? hood 'gabrielle)))
                (let ((parker (amb 'mary 'gabrielle 'lorna 'rosalind 'melissa)))
                  (require (not (eq? parker 'gabrielle)))
                  (require (distinct? (list moore downing hall hood parker)))
                  (list (list 'moore moore)
                        (list 'downing downing)
                        (list 'hall hall)
                        (list 'hood hood)
                        (list 'parker parker))))))))
     env)
    (pp (ambeval* '(yachts) env))))
