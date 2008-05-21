(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (fold-right op init seq)
  (accumulate op init seq))

;; Iterative; opposed to fold-right (accumulate):
;; recursive.
(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Conceptually: cdr through each successive
;; sub-sequence (accumulate-n); accumulate the
;; car of each cdr'd subsequence (accumulate).
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons
       (accumulate op init (map car seqs))
       (accumulate-n op init (map cdr seqs)))))

(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (j)
                    (cons i j))
                  (unique-pairs (- i 1))))
                   (enumerate-interval 1 n)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
