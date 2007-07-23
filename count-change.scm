(define (count-change amount)
  (display "digraph count {")
  (newline)
  (cc amount 5 "")
  (display "}")
  (newline))


(define (cc amount kinds-of-coins last-node)
  (define (node amount kinds-of-coins)
    (string-append "\"" (number->string amount) " " (number->string kinds-of-coins) "\""))
  (define (link whence whither)
    (string-append whence " -> " whither))
  (define this-node (node amount kinds-of-coins))
  (if (not (string=? last-node ""))
      (begin
        (display (link last-node this-node))
        (newline)
      ))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+
               ;; Get busy on the subdenominations,
               ;; until we hit bottom.
               (cc amount
                   (- kinds-of-coins 1) this-node)
               ;; Counteth down to below 0 (which
               ;; hits (< amount 0) above).
               (cc (- amount
                      (first-denomination kinds-of-coins))
                   kinds-of-coins this-node)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
        ))

(count-change 1)
(count-change 2)
(count-change 4)
(count-change 8)
(count-change 16)
