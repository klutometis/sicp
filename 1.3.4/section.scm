(require-extension syntax-case)
(require '../1.3.3/section)
(require '../util/util)
(module
 section-1.3.4
 (compose
  repeated
  fixed-point-of-transform
  newtons-method
  average-damp)
 (import* section-1.3.3
          fixed-point)
 (import* util
          average)
 (include "../1.3.4/compose.scm")
 (include "../1.3.4/newtons-method.scm"))
