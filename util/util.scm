(require-extension
 syntax-case
 (srfi 11 18))
(require '../srfi/srfi-70)
(module
 util
 (square
  cube
  identity
  timed-result
  approx?
  approx-n?
  terminate?)
 (import* srfi-70
          exact-round)
 (include "../util/arithmetic.scm")
 (include "../util/time.scm")
 (include "../util/test.scm"))
