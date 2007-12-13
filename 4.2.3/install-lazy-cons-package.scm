;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "make-procedure.scm")
(load "lambda-parameters.scm")
(load "lambda-body.scm")
(load "put-print.scm")

(define (install-lazy-cons-package)
  (define (make-lazy-pair exp env)
;;     (write-line '*******)
;;     (write-line exp)
;;     (eval (list 'lambda '(m) (list 'm (cadr exp) (if (null? (caddr exp))
;;                                                      (list 'quote '())
;;                                                      (caddr exp)))) env))
;;    (write-line '!!!!!!!!!!)
    (list 'lazy-pair '(m) (list (list 'm (cadr exp) (caddr exp))) env))
  (put 'cons make-lazy-pair)

  (define (eval-lazy-pair exp env)
    (write-line '***********)
    (write-line exp)
    (write-line (lambda-parameters exp))
    (write-line (lambda-body exp))
    (write-line (operator exp))
    (write-line (operands exp))
;;     (eval (list 'lambda
;;                 (lambda-parameters exp)
;;                 (lambda-body exp)) env))
    (list 'lazy-pair
          (lambda-parameters exp)
          (list (lambda-body exp) env)))

  (put 'lazy-pair eval-lazy-pair)

  (put-print 'lazy-pair
;;   (lambda (lazy-pair) (write-line '@@@@@@@@@@@@@) (display (eval lazy-pair the-global-environment))))
;;   (lambda (lazy-pair) (display (apply lazy-pair the-global-environment))))
;;   (lambda (lazy-pair) (display (eval (cadr lazy-pair) the-global-environment))))
   (lambda (lazy-pair)
     (write-char #\()
     (let print-n ((lazy-pair lazy-pair)
                   (n 10))
;;        (write-line '***********)
;;        (write-line lazy-pair)
       (cond
        ((not (lazy-pair? lazy-pair))
         (write-char #\)))
        ((zero? n)
         (write '...)
         (write-char #\)))
        (else
         (let* ((contents (cdar (caddr lazy-pair)))
                (first (car contents))
                (rest (cadr contents)))
           (write first)
           (if (not (null? rest)) (write-char #\space))
           (print-n (if (null? rest) rest (eval rest the-global-environment)) (-1+ n))))))))
  
  'done)
