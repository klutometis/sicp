(require-extension syntax-case)
(require '../util/util)
(module
 section-2.1.2
 (x-point
  y-point
  make-segment
  make-point
  midpoint-segment
  print-point
  make-rectangle-edges
  length-rectangle-edges
  width-rectangle-edges
  perimeter-rectangle
  area-rectangle
  make-rectangle-diagonal
  length-rectangle-diagonal
  width-rectangle-diagonal)
 (import* util average square)
 (include "../2.1.2/segment.scm")
 (include "../2.1.2/rectangle.scm"))
