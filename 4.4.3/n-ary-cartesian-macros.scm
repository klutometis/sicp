;; Clownish; see
;; http://ircbrowse.com/cview.html?utime=3395955810&channel=scheme&start=3395952215&end=3395959415#utime_requested
(define-syntax make-variable
  (syntax-rules ()
    ((_)
     (let ((index 0))
       (lambda () (set! index (1+ index))
               (string->symbol
                (string-append "var-" (number->string index))))))))

(define-syntax expand-combinations
  (syntax-rules ()
    ((_ next-variable variables combinandum combinanda ...)
     (let ((variable (next-variable)))
       `(map (lambda (,variable)
               ,(_ next-variable
                   (append variables (list variable)) combinanda ...))
             ,variable)))
    ((_ next-variable variables combinandum ...)
     `(let ((combination (list (list ,@variables))))
        (if (null? combinations)
            (set! combinations combination)
            (append! combinations combination))))))

(define-syntax combination-variables
  (syntax-rules ()
    ((_ next-variable variables combinandum combinanda ...)
     (let ((variable (list (next-variable))))
       (if (null? variables)
           (set! variables variable)
           (append! variables variable))
       (_ next-variable variables combinanda ...)))
    ((_ next-variable variables combinandum ...)
     variables)))

(define-syntax combinations
  (syntax-rules ()
    ((_ combinanda ...)
     (let* ((next-variable (make-variable))
            (variables '())
            (combination-variables
             (combination-variables next-variable variables combinanda ...)))
       (eval
        `(let ((combinations '()))
           ((lambda ,combination-variables
              ,(let ((next-variable (make-variable))
                     (variables '()))
                 (expand-combinations next-variable variables combinanda ...)))
            combinanda ...)
           combinations)
        (nearest-repl/environment))))))
