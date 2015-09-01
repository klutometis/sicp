#!/usr/bin/env chicken-scheme

(use sicp sicp-eval-logic sicp-streams test)

(define (accumulator-variable exp) (car exp))
(define (accumulator-query exp) (cadr exp))

;; We need to recurse up the tree when we're unifying; in case e.g. (?
;; salary) actually refers to (? 2 salary).
(define (recursive-binding-value variable frame)
  (let iter ((value (binding-value (binding-in-frame variable frame))))
    (if (var? value)
        (iter (binding-value (binding-in-frame value frame)))
        value)))

(define (make-accumulator name f)
  (put name
       'qeval-accumulator
       (lambda (exp frame-stream)
         (let ((variable (accumulator-variable exp))
               (query (accumulator-query exp)))
           (f (stream-map (lambda (frame)
                            (recursive-binding-value variable frame))
                          (qeval query frame-stream)))))))

(define (make-memoized-accumulator name f)
  (put name
       'qeval-accumulator
       (lambda (exp frame-stream)
         (let ((variable (accumulator-variable exp))
               (query (accumulator-query exp))
               (seen? (make-hash-table)))
           (f (stream-map (lambda (frame)
                            (recursive-binding-value variable frame))
                          (stream-filter
                           (lambda (frame)
                             (let ((instantiated-frame
                                    (instantiate query frame (lambda (v f) (contract-question-mark v)))))
                               (and (not (hash-table-ref/default seen? instantiated-frame #f))
                                    (hash-table-set! seen? instantiated-frame #t))))
                           (qeval query frame-stream))))))))

(define (qeval query frame-stream)
  (let ((qproc (or (get (type query) 'qeval)
                   (get (type query) 'qeval-accumulator))))
    (if qproc
        (qproc (contents query) frame-stream)
        (simple-query query frame-stream))))

(define (accumulator? query)
  (get (type query) 'qeval-accumulator))

(define qeval*
  (case-lambda
   ((query) (qeval* query +inf.0))
   ((query n)
    (let ((q (query-syntax-process query)))
      (cond ((assertion-to-be-added? q)
             (add-rule-or-assertion! (add-assertion-body q)))
            ((accumulator? query)
             (qeval q (singleton-stream '())))
            (else
             (stream->list
              (stream-map
               (lambda (frame)
                 (instantiate q frame (lambda (v f) (contract-question-mark v))))
               (qeval q (singleton-stream '())))
              n)))))))

(define (stream-fold cons nil stream)
  (if (stream-null? stream)
      nil
      (stream-fold cons (cons nil (stream-car stream)) (stream-cdr stream))))

(with-microshaft-database
 (lambda ()
   (make-accumulator 'sum (lambda (value-stream) (stream-fold + 0 value-stream)))
   (make-accumulator 'max (lambda (value-stream) (stream-fold max -inf value-stream)))
   
   (test
    "Summed salary"
    75000
    (qeval* '(sum ?amount
                  (and (job ?x (computer programmer))
                       (salary ?x ?amount)))))
   
   (test
    "Max salary"
    40000.0
    (qeval* '(max ?amount
                  (and (job ?x (computer programmer))
                       (salary ?x ?amount)))))
   
   (qeval* '(assert! (rule (wheel-salary ?person ?salary)
                           (and (supervisor ?middle-manager ?person)
                                (supervisor ?x ?middle-manager)
                                (salary ?person ?salary)))))

   (make-memoized-accumulator 'memoized-sum (lambda (value-stream) (stream-fold + 0 value-stream)))

   (test
    "Naïve summed salary counts Oliver four times."
    660000
    (qeval* '(sum ?salary (wheel-salary ?wheel ?salary))))
   
   (test
    "Memoized summed salary counts Oliver only once."
    210000
    (qeval* '(memoized-sum ?salary (wheel-salary ?wheel ?salary))))))
