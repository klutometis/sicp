(define (start-graph)
  (display "digraph G {")
  (newline))

(define (end-graph)
  (display "}")
  (newline))

(define (node label)
  (string-append "\"" label "\""))

(define (link whence whither)
  (display (string-append whence " -> " whither))
  (newline))
